﻿// Copyright (c) 2014 Daniel Grunwald
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy of this
// software and associated documentation files (the "Software"), to deal in the Software
// without restriction, including without limitation the rights to use, copy, modify, merge,
// publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons
// to whom the Software is furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all copies or
// substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
// PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

using System;
using System.Collections.Generic;
using System.Collections.Immutable;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ICSharpCode.Decompiler.IL
{
	/// <summary>
	/// Unconditional branch. <c>goto target;</c>
	/// </summary>
	/// <remarks>
	/// When jumping to the entrypoint of the current block container, the branch represents a <c>continue</c> statement.
	/// 
	/// Phase-1 execution of a branch is a no-op.
	/// Phase-2 execution removes PopCount elements from the evaluation stack
	/// and jumps to the target block.
	/// </remarks>
	partial class Leave : SimpleInstruction
	{
		BlockContainer targetContainer;
		
		/// <summary>
		/// Pops the specified number of arguments from the evaluation stack during the branching operation.
		/// </summary>
		public int PopCount;
		
		public Leave(BlockContainer targetContainer) : base(OpCode.Leave)
		{
			if (targetContainer == null)
				throw new ArgumentNullException("targetContainer");
			this.targetContainer = targetContainer;
		}
		
		protected override InstructionFlags ComputeFlags()
		{
			var flags = InstructionFlags.MayBranch | InstructionFlags.EndPointUnreachable;
			if (PopCount > 0) {
				// the branch pop happens during phase-2, so don't use MayPop
				flags |= InstructionFlags.MayWriteEvaluationStack;
			}
			return flags;
		}
		
		public BlockContainer TargetContainer {
			get { return targetContainer; }
			set {
				if (targetContainer != null && IsConnected)
					targetContainer.LeaveCount--;
				targetContainer = value;
				if (targetContainer != null && IsConnected)
					targetContainer.LeaveCount++;
			}
		}
		
		protected override void Connected()
		{
			base.Connected();
			if (targetContainer != null)
				targetContainer.LeaveCount++;
		}
		
		protected override void Disconnected()
		{
			base.Disconnected();
			if (targetContainer != null)
				targetContainer.LeaveCount--;
		}
		
		public string TargetLabel {
			get { return targetContainer.EntryPoint.Label; }
		}
		
		internal override void CheckInvariant()
		{
			base.CheckInvariant();
			Debug.Assert(this.IsDescendantOf(targetContainer));
		}
		
		public override void WriteTo(ITextOutput output)
		{
			output.Write(OpCode);
			output.Write(' ');
			output.WriteReference(TargetLabel, targetContainer, isLocal: true);
			if (PopCount != 0) {
				output.Write(" (pops ");
				output.Write(PopCount.ToString());
				output.Write(" element)");
			}
		}
		
		internal override void TransformStackIntoVariables(TransformStackIntoVariablesState state)
		{
			ImmutableArray<ILVariable> variables;
			if (state.FinalVariables.TryGetValue(targetContainer, out variables)) {
				state.MergeVariables(state.Variables, variables.ToStack());
			} else {
				state.FinalVariables.Add(targetContainer, state.Variables.ToImmutableArray());
			}
			state.Variables.Clear();
		}
	}
}
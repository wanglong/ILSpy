
//  Microsoft (R) .NET Framework IL Disassembler.  Version 4.0.30319.17929
//  Copyright (c) Microsoft Corporation.  All rights reserved.



// Metadata version: v4.0.30319
.assembly extern mscorlib
{
  .publickeytoken = (B7 7A 5C 56 19 34 E0 89 )                         // .z\V.4..
  .ver 4:0:0:0
}
.assembly crlipbnv
{
  .custom instance void [mscorlib]System.Runtime.CompilerServices.CompilationRelaxationsAttribute::.ctor(int32) = ( 01 00 08 00 00 00 00 00 ) 
  .custom instance void [mscorlib]System.Runtime.CompilerServices.RuntimeCompatibilityAttribute::.ctor() = ( 01 00 01 00 54 02 16 57 72 61 70 4E 6F 6E 45 78   // ....T..WrapNonEx
                                                                                                             63 65 70 74 69 6F 6E 54 68 72 6F 77 73 01 )       // ceptionThrows.
  .permissionset reqmin
             = {[mscorlib]System.Security.Permissions.SecurityPermissionAttribute = {property bool 'SkipVerification' = bool(true)}}
  .hash algorithm 0x00008004
  .ver 0:0:0:0
}
.module crlipbnv.dll
// MVID: {2550E8B3-391D-448D-A5A5-7F434CA2D173}
.custom instance void [mscorlib]System.Security.UnverifiableCodeAttribute::.ctor() = ( 01 00 00 00 ) 
.imagebase 0x10000000
.file alignment 0x00000200
.stackreserve 0x00100000
.subsystem 0x0003       // WINDOWS_CUI
.corflags 0x00000001    //  ILONLY
// Image base: 0x00A40000


// =============== CLASS MEMBERS DECLARATION ===================

.class public abstract auto ansi beforefieldinit ICSharpCode.Decompiler.Tests.TestCases.Pretty.ExceptionHandling
       extends [mscorlib]System.Object
{
  .method public hidebysig newslot abstract virtual 
          instance bool  B(int32 i) cil managed
  {
  } // end of method ExceptionHandling::B

  .method public hidebysig newslot abstract virtual 
          instance void  M(int32 i) cil managed
  {
  } // end of method ExceptionHandling::M

  .method public hidebysig instance bool 
          ConditionalReturnInThrow() cil managed
  {
    // Code size       43 (0x2b)
    .maxstack  2
    .locals init (bool V_0,
             bool V_1)
    IL_0000:  nop
    .try
    {
      IL_0001:  nop
      IL_0002:  ldarg.0
      IL_0003:  ldc.i4.0
      IL_0004:  callvirt   instance bool ICSharpCode.Decompiler.Tests.TestCases.Pretty.ExceptionHandling::B(int32)
      IL_0009:  ldc.i4.0
      IL_000a:  ceq
      IL_000c:  stloc.1
      IL_000d:  ldloc.1
      IL_000e:  brtrue.s   IL_001b

      IL_0010:  nop
      IL_0011:  ldarg.0
      IL_0012:  ldc.i4.1
      IL_0013:  callvirt   instance bool ICSharpCode.Decompiler.Tests.TestCases.Pretty.ExceptionHandling::B(int32)
      IL_0018:  stloc.0
      IL_0019:  leave.s    IL_0028

      IL_001b:  nop
      IL_001c:  leave.s    IL_0023

    }  // end .try
    catch [mscorlib]System.Object 
    {
      IL_001e:  pop
      IL_001f:  nop
      IL_0020:  nop
      IL_0021:  leave.s    IL_0023

    }  // end handler
    IL_0023:  nop
    IL_0024:  ldc.i4.0
    IL_0025:  stloc.0
    IL_0026:  br.s       IL_0028

    IL_0028:  nop
    IL_0029:  ldloc.0
    IL_002a:  ret
  } // end of method ExceptionHandling::ConditionalReturnInThrow

  .method public hidebysig instance bool 
          SimpleTryCatchException() cil managed
  {
    // Code size       56 (0x38)
    .maxstack  2
    .locals init (bool V_0)
    IL_0000:  nop
    .try
    {
      IL_0001:  nop
      IL_0002:  ldstr      "Try"
      IL_0007:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_000c:  nop
      IL_000d:  ldarg.0
      IL_000e:  newobj     instance void [mscorlib]System.Random::.ctor()
      IL_0013:  callvirt   instance int32 [mscorlib]System.Random::Next()
      IL_0018:  callvirt   instance bool ICSharpCode.Decompiler.Tests.TestCases.Pretty.ExceptionHandling::B(int32)
      IL_001d:  stloc.0
      IL_001e:  leave.s    IL_0035

    }  // end .try
    catch [mscorlib]System.Exception 
    {
      IL_0020:  pop
      IL_0021:  nop
      IL_0022:  ldstr      "CatchException"
      IL_0027:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_002c:  nop
      IL_002d:  nop
      IL_002e:  leave.s    IL_0030

    }  // end handler
    IL_0030:  nop
    IL_0031:  ldc.i4.0
    IL_0032:  stloc.0
    IL_0033:  br.s       IL_0035

    IL_0035:  nop
    IL_0036:  ldloc.0
    IL_0037:  ret
  } // end of method ExceptionHandling::SimpleTryCatchException

  .method public hidebysig instance bool 
          SimpleTryCatchExceptionWithName() cil managed
  {
    // Code size       67 (0x43)
    .maxstack  2
    .locals init (class [mscorlib]System.Exception V_0,
             bool V_1)
    IL_0000:  nop
    .try
    {
      IL_0001:  nop
      IL_0002:  ldstr      "Try"
      IL_0007:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_000c:  nop
      IL_000d:  ldarg.0
      IL_000e:  newobj     instance void [mscorlib]System.Random::.ctor()
      IL_0013:  callvirt   instance int32 [mscorlib]System.Random::Next()
      IL_0018:  callvirt   instance bool ICSharpCode.Decompiler.Tests.TestCases.Pretty.ExceptionHandling::B(int32)
      IL_001d:  stloc.1
      IL_001e:  leave.s    IL_0040

    }  // end .try
    catch [mscorlib]System.Exception 
    {
      IL_0020:  stloc.0
      IL_0021:  nop
      IL_0022:  ldstr      "CatchException ex: "
      IL_0027:  ldloc.0
      IL_0028:  callvirt   instance string [mscorlib]System.Object::ToString()
      IL_002d:  call       string [mscorlib]System.String::Concat(string,
                                                                  string)
      IL_0032:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_0037:  nop
      IL_0038:  nop
      IL_0039:  leave.s    IL_003b

    }  // end handler
    IL_003b:  nop
    IL_003c:  ldc.i4.0
    IL_003d:  stloc.1
    IL_003e:  br.s       IL_0040

    IL_0040:  nop
    IL_0041:  ldloc.1
    IL_0042:  ret
  } // end of method ExceptionHandling::SimpleTryCatchExceptionWithName

  .method public hidebysig instance bool 
          SimpleTryFinally() cil managed
  {
    // Code size       37 (0x25)
    .maxstack  1
    .locals init (bool V_0)
    IL_0000:  nop
    .try
    {
      IL_0001:  nop
      IL_0002:  ldstr      "Try"
      IL_0007:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_000c:  nop
      IL_000d:  nop
      IL_000e:  leave.s    IL_001e

    }  // end .try
    finally
    {
      IL_0010:  nop
      IL_0011:  ldstr      "Finally"
      IL_0016:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_001b:  nop
      IL_001c:  nop
      IL_001d:  endfinally
    }  // end handler
    IL_001e:  nop
    IL_001f:  ldc.i4.0
    IL_0020:  stloc.0
    IL_0021:  br.s       IL_0023

    IL_0023:  ldloc.0
    IL_0024:  ret
  } // end of method ExceptionHandling::SimpleTryFinally

  .method public hidebysig instance void 
          MethodEndingWithEndFinally() cil managed
  {
    // Code size       13 (0xd)
    .maxstack  1
    IL_0000:  nop
    .try
    {
      IL_0001:  nop
      IL_0002:  ldnull
      IL_0003:  throw

    }  // end .try
    finally
    {
      IL_0004:  nop
      IL_0005:  call       void [mscorlib]System.Console::WriteLine()
      IL_000a:  nop
      IL_000b:  nop
      IL_000c:  endfinally
    }  // end handler
  } // end of method ExceptionHandling::MethodEndingWithEndFinally

  .method public hidebysig instance void 
          MethodEndingWithRethrow() cil managed
  {
    // Code size       8 (0x8)
    .maxstack  1
    IL_0000:  nop
    .try
    {
      IL_0001:  nop
      IL_0002:  ldnull
      IL_0003:  throw

    }  // end .try
    catch [mscorlib]System.Object 
    {
      IL_0004:  pop
      IL_0005:  nop
      IL_0006:  rethrow
    }  // end handler
  } // end of method ExceptionHandling::MethodEndingWithRethrow

  .method public hidebysig instance void 
          TryCatchFinally() cil managed
  {
    // Code size       52 (0x34)
    .maxstack  1
    .locals init (class [mscorlib]System.Exception V_0)
    IL_0000:  nop
    .try
    {
      .try
      {
        IL_0001:  nop
        IL_0002:  ldstr      "Try"
        IL_0007:  call       void [mscorlib]System.Console::WriteLine(string)
        IL_000c:  nop
        IL_000d:  nop
        IL_000e:  leave.s    IL_0021

      }  // end .try
      catch [mscorlib]System.Exception 
      {
        IL_0010:  stloc.0
        IL_0011:  nop
        IL_0012:  ldloc.0
        IL_0013:  callvirt   instance string [mscorlib]System.Exception::get_Message()
        IL_0018:  call       void [mscorlib]System.Console::WriteLine(string)
        IL_001d:  nop
        IL_001e:  nop
        IL_001f:  leave.s    IL_0021

      }  // end handler
      IL_0021:  nop
      IL_0022:  leave.s    IL_0032

    }  // end .try
    finally
    {
      IL_0024:  nop
      IL_0025:  ldstr      "Finally"
      IL_002a:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_002f:  nop
      IL_0030:  nop
      IL_0031:  endfinally
    }  // end handler
    IL_0032:  nop
    IL_0033:  ret
  } // end of method ExceptionHandling::TryCatchFinally

  .method public hidebysig instance void 
          TryCatchMultipleHandlers() cil managed
  {
    // Code size       68 (0x44)
    .maxstack  1
    .locals init (class [mscorlib]System.InvalidOperationException V_0,
             class [mscorlib]System.Exception V_1)
    IL_0000:  nop
    .try
    {
      IL_0001:  nop
      IL_0002:  ldstr      "Try"
      IL_0007:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_000c:  nop
      IL_000d:  nop
      IL_000e:  leave.s    IL_0042

    }  // end .try
    catch [mscorlib]System.InvalidOperationException 
    {
      IL_0010:  stloc.0
      IL_0011:  nop
      IL_0012:  ldloc.0
      IL_0013:  callvirt   instance string [mscorlib]System.Exception::get_Message()
      IL_0018:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_001d:  nop
      IL_001e:  nop
      IL_001f:  leave.s    IL_0042

    }  // end handler
    catch [mscorlib]System.Exception 
    {
      IL_0021:  stloc.1
      IL_0022:  nop
      IL_0023:  ldloc.1
      IL_0024:  callvirt   instance string [mscorlib]System.Exception::get_Message()
      IL_0029:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_002e:  nop
      IL_002f:  nop
      IL_0030:  leave.s    IL_0042

    }  // end handler
    catch [mscorlib]System.Object 
    {
      IL_0032:  pop
      IL_0033:  nop
      IL_0034:  ldstr      "other"
      IL_0039:  call       void [mscorlib]System.Console::WriteLine(string)
      IL_003e:  nop
      IL_003f:  nop
      IL_0040:  leave.s    IL_0042

    }  // end handler
    IL_0042:  nop
    IL_0043:  ret
  } // end of method ExceptionHandling::TryCatchMultipleHandlers

  .method public hidebysig instance void 
          NoUsingStatementBecauseTheVariableIsAssignedTo() cil managed
  {
    // Code size       35 (0x23)
    .maxstack  2
    .locals init (class [mscorlib]System.Threading.CancellationTokenSource V_0,
             bool V_1)
    IL_0000:  nop
    IL_0001:  ldnull
    IL_0002:  stloc.0
    .try
    {
      IL_0003:  nop
      IL_0004:  newobj     instance void [mscorlib]System.Threading.CancellationTokenSource::.ctor()
      IL_0009:  stloc.0
      IL_000a:  nop
      IL_000b:  leave.s    IL_0021

    }  // end .try
    finally
    {
      IL_000d:  nop
      IL_000e:  ldloc.0
      IL_000f:  ldnull
      IL_0010:  ceq
      IL_0012:  stloc.1
      IL_0013:  ldloc.1
      IL_0014:  brtrue.s   IL_001f

      IL_0016:  nop
      IL_0017:  ldloc.0
      IL_0018:  callvirt   instance void [mscorlib]System.Threading.CancellationTokenSource::Dispose()
      IL_001d:  nop
      IL_001e:  nop
      IL_001f:  nop
      IL_0020:  endfinally
    }  // end handler
    IL_0021:  nop
    IL_0022:  ret
  } // end of method ExceptionHandling::NoUsingStatementBecauseTheVariableIsAssignedTo

  .method family hidebysig specialname rtspecialname 
          instance void  .ctor() cil managed
  {
    // Code size       7 (0x7)
    .maxstack  8
    IL_0000:  ldarg.0
    IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
    IL_0006:  ret
  } // end of method ExceptionHandling::.ctor

} // end of class ICSharpCode.Decompiler.Tests.TestCases.Pretty.ExceptionHandling


// =============================================================

// *********** DISASSEMBLY COMPLETE ***********************
// WARNING: Created Win32 resource file ../../../TestCases/Pretty\ExceptionHandling.res

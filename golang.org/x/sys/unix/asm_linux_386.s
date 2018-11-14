// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build !gccgo

#include "textflag.h"

//
// System calls for 386, Linux
//

// See ../runtime/sys_linux_386.s for the reason why we always use int 0x80
// instead of the glibc-specific "CALL 0x10(GS)".
#define INVOKE_SYSCALL	INT	$0x80

// Just jump to package syscall's implementation for all these functions.
// The runtime may know about them.

TEXT 揃Syscall(SB),NOSPLIT,$0-28
	JMP	syscall揃Syscall(SB)

TEXT 揃Syscall6(SB),NOSPLIT,$0-40
	JMP	syscall揃Syscall6(SB)

TEXT 揃SyscallNoError(SB),NOSPLIT,$0-24
	CALL	runtime揃entersyscall(SB)
	MOVL	trap+0(FP), AX  // syscall entry
	MOVL	a1+4(FP), BX
	MOVL	a2+8(FP), CX
	MOVL	a3+12(FP), DX
	MOVL	$0, SI
	MOVL	$0, DI
	INVOKE_SYSCALL
	MOVL	AX, r1+16(FP)
	MOVL	DX, r2+20(FP)
	CALL	runtime揃exitsyscall(SB)
	RET

TEXT 揃RawSyscall(SB),NOSPLIT,$0-28
	JMP	syscall揃RawSyscall(SB)

TEXT 揃RawSyscall6(SB),NOSPLIT,$0-40
	JMP	syscall揃RawSyscall6(SB)

TEXT 揃RawSyscallNoError(SB),NOSPLIT,$0-24
	MOVL	trap+0(FP), AX  // syscall entry
	MOVL	a1+4(FP), BX
	MOVL	a2+8(FP), CX
	MOVL	a3+12(FP), DX
	MOVL	$0, SI
	MOVL	$0, DI
	INVOKE_SYSCALL
	MOVL	AX, r1+16(FP)
	MOVL	DX, r2+20(FP)
	RET

TEXT 揃socketcall(SB),NOSPLIT,$0-36
	JMP	syscall揃socketcall(SB)

TEXT 揃rawsocketcall(SB),NOSPLIT,$0-36
	JMP	syscall揃rawsocketcall(SB)

TEXT 揃seek(SB),NOSPLIT,$0-28
	JMP	syscall揃seek(SB)

// Copyright 2009 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build !gccgo

#include "textflag.h"

//
// System calls for arm, Linux
//

// Just jump to package syscall's implementation for all these functions.
// The runtime may know about them.

TEXT 揃Syscall(SB),NOSPLIT,$0-28
	B	syscall揃Syscall(SB)

TEXT 揃Syscall6(SB),NOSPLIT,$0-40
	B	syscall揃Syscall6(SB)

TEXT 揃SyscallNoError(SB),NOSPLIT,$0-24
	BL	runtime揃entersyscall(SB)
	MOVW	trap+0(FP), R7
	MOVW	a1+4(FP), R0
	MOVW	a2+8(FP), R1
	MOVW	a3+12(FP), R2
	MOVW	$0, R3
	MOVW	$0, R4
	MOVW	$0, R5
	SWI	$0
	MOVW	R0, r1+16(FP)
	MOVW	$0, R0
	MOVW	R0, r2+20(FP)
	BL	runtime揃exitsyscall(SB)
	RET

TEXT 揃RawSyscall(SB),NOSPLIT,$0-28
	B	syscall揃RawSyscall(SB)

TEXT 揃RawSyscall6(SB),NOSPLIT,$0-40
	B	syscall揃RawSyscall6(SB)

TEXT 揃RawSyscallNoError(SB),NOSPLIT,$0-24
	MOVW	trap+0(FP), R7	// syscall entry
	MOVW	a1+4(FP), R0
	MOVW	a2+8(FP), R1
	MOVW	a3+12(FP), R2
	SWI	$0
	MOVW	R0, r1+16(FP)
	MOVW	$0, R0
	MOVW	R0, r2+20(FP)
	RET

TEXT 揃seek(SB),NOSPLIT,$0-28
	B	syscall揃seek(SB)

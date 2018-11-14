// Copyright 2016 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build linux
// +build mips mipsle
// +build !gccgo

#include "textflag.h"

//
// System calls for mips, Linux
//

// Just jump to package syscall's implementation for all these functions.
// The runtime may know about them.

TEXT 揃Syscall(SB),NOSPLIT,$0-28
	JMP syscall揃Syscall(SB)

TEXT 揃Syscall6(SB),NOSPLIT,$0-40
	JMP syscall揃Syscall6(SB)

TEXT 揃Syscall9(SB),NOSPLIT,$0-52
	JMP syscall揃Syscall9(SB)

TEXT 揃SyscallNoError(SB),NOSPLIT,$0-24
	JAL	runtime揃entersyscall(SB)
	MOVW	a1+4(FP), R4
	MOVW	a2+8(FP), R5
	MOVW	a3+12(FP), R6
	MOVW	R0, R7
	MOVW	trap+0(FP), R2	// syscall entry
	SYSCALL
	MOVW	R2, r1+16(FP)	// r1
	MOVW	R3, r2+20(FP)	// r2
	JAL	runtime揃exitsyscall(SB)
	RET

TEXT 揃RawSyscall(SB),NOSPLIT,$0-28
	JMP syscall揃RawSyscall(SB)

TEXT 揃RawSyscall6(SB),NOSPLIT,$0-40
	JMP syscall揃RawSyscall6(SB)

TEXT 揃RawSyscallNoError(SB),NOSPLIT,$0-24
	MOVW	a1+4(FP), R4
	MOVW	a2+8(FP), R5
	MOVW	a3+12(FP), R6
	MOVW	trap+0(FP), R2	// syscall entry
	SYSCALL
	MOVW	R2, r1+16(FP)
	MOVW	R3, r2+20(FP)
	RET

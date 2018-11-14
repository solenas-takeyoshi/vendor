// Copyright 2015 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build linux
// +build arm64
// +build !gccgo

#include "textflag.h"

// Just jump to package syscall's implementation for all these functions.
// The runtime may know about them.

TEXT 揃Syscall(SB),NOSPLIT,$0-56
	B	syscall揃Syscall(SB)

TEXT 揃Syscall6(SB),NOSPLIT,$0-80
	B	syscall揃Syscall6(SB)

TEXT 揃SyscallNoError(SB),NOSPLIT,$0-48
	BL	runtime揃entersyscall(SB)
	MOVD	a1+8(FP), R0
	MOVD	a2+16(FP), R1
	MOVD	a3+24(FP), R2
	MOVD	$0, R3
	MOVD	$0, R4
	MOVD	$0, R5
	MOVD	trap+0(FP), R8	// syscall entry
	SVC
	MOVD	R0, r1+32(FP)	// r1
	MOVD	R1, r2+40(FP)	// r2
	BL	runtime揃exitsyscall(SB)
	RET

TEXT 揃RawSyscall(SB),NOSPLIT,$0-56
	B	syscall揃RawSyscall(SB)

TEXT 揃RawSyscall6(SB),NOSPLIT,$0-80
	B	syscall揃RawSyscall6(SB)

TEXT 揃RawSyscallNoError(SB),NOSPLIT,$0-48
	MOVD	a1+8(FP), R0
	MOVD	a2+16(FP), R1
	MOVD	a3+24(FP), R2
	MOVD	$0, R3
	MOVD	$0, R4
	MOVD	$0, R5
	MOVD	trap+0(FP), R8	// syscall entry
	SVC
	MOVD	R0, r1+32(FP)
	MOVD	R1, r2+40(FP)
	RET

// Copyright 2015 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build !gccgo
// +build arm64,darwin

#include "textflag.h"

//
// System call support for AMD64, Darwin
//

// Just jump to package syscall's implementation for all these functions.
// The runtime may know about them.

TEXT	揃Syscall(SB),NOSPLIT,$0-56
	B	syscall揃Syscall(SB)

TEXT	揃Syscall6(SB),NOSPLIT,$0-80
	B	syscall揃Syscall6(SB)

TEXT	揃Syscall9(SB),NOSPLIT,$0-104
	B	syscall揃Syscall9(SB)

TEXT	揃RawSyscall(SB),NOSPLIT,$0-56
	B	syscall揃RawSyscall(SB)

TEXT	揃RawSyscall6(SB),NOSPLIT,$0-80
	B	syscall揃RawSyscall6(SB)

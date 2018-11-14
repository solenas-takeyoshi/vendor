// Copyright 2017 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build !gccgo

#include "textflag.h"

//
// System call support for ARM, OpenBSD
//

// Just jump to package syscall's implementation for all these functions.
// The runtime may know about them.

TEXT	揃Syscall(SB),NOSPLIT,$0-28
	B	syscall揃Syscall(SB)

TEXT	揃Syscall6(SB),NOSPLIT,$0-40
	B	syscall揃Syscall6(SB)

TEXT	揃Syscall9(SB),NOSPLIT,$0-52
	B	syscall揃Syscall9(SB)

TEXT	揃RawSyscall(SB),NOSPLIT,$0-28
	B	syscall揃RawSyscall(SB)

TEXT	揃RawSyscall6(SB),NOSPLIT,$0-40
	B	syscall揃RawSyscall6(SB)

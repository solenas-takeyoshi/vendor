// Copyright 2014 The Go Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// +build !gccgo

#include "textflag.h"

//
// System calls for amd64, Solaris are implemented in runtime/syscall_solaris.go
//

TEXT 揃sysvicall6(SB),NOSPLIT,$0-88
	JMP	syscall揃sysvicall6(SB)

TEXT 揃rawSysvicall6(SB),NOSPLIT,$0-88
	JMP	syscall揃rawSysvicall6(SB)

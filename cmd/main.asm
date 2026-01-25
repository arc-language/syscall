
main:     file format elf64-x86-64


Disassembly of section .text:

000000000040103c <.text>:
  40103c:	31 ed                	xor    ebp,ebp
  40103e:	49 89 d1             	mov    r9,rdx
  401041:	5e                   	pop    rsi
  401042:	48 89 e2             	mov    rdx,rsp
  401045:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  401049:	48 8d 3d 0c 00 00 00 	lea    rdi,[rip+0xc]        # 0x40105c
  401050:	48 31 c9             	xor    rcx,rcx
  401053:	45 31 c0             	xor    r8d,r8d
  401056:	e8 c1 ff ff ff       	call   0x40101c
  40105b:	f4                   	hlt
  40105c:	57                   	push   rdi
  40105d:	56                   	push   rsi
  40105e:	48 31 ff             	xor    rdi,rdi
  401061:	48 be 00 20 00 00 00 	movabs rsi,0x2000
  401068:	00 00 00 
  40106b:	48 ba 03 00 00 00 00 	movabs rdx,0x3
  401072:	00 00 00 
  401075:	49 ba 22 00 00 00 00 	movabs r10,0x22
  40107c:	00 00 00 
  40107f:	49 b8 ff ff ff ff ff 	movabs r8,0xffffffffffffffff
  401086:	ff ff ff 
  401089:	4d 31 c9             	xor    r9,r9
  40108c:	48 b8 09 00 00 00 00 	movabs rax,0x9
  401093:	00 00 00 
  401096:	0f 05                	syscall
  401098:	48 83 ec 20          	sub    rsp,0x20
  40109c:	48 89 84 24 00 00 00 	mov    QWORD PTR [rsp+0x0],rax
  4010a3:	00 
  4010a4:	c7 84 24 08 00 00 00 	mov    DWORD PTR [rsp+0x8],0x0
  4010ab:	00 00 00 00 
  4010af:	48 c7 84 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x2000
  4010b6:	00 00 20 00 00 
  4010bb:	48 89 e7             	mov    rdi,rsp
  4010be:	48 31 f6             	xor    rsi,rsi
  4010c1:	48 b8 83 00 00 00 00 	movabs rax,0x83
  4010c8:	00 00 00 
  4010cb:	0f 05                	syscall
  4010cd:	48 83 c4 20          	add    rsp,0x20
  4010d1:	e9 65 00 00 00       	jmp    0x40113b
  4010d6:	f3 0f 1e fa          	endbr64
  4010da:	48 8b 86 10 00 00 00 	mov    rax,QWORD PTR [rsi+0x10]
  4010e1:	48 81 e0 00 f0 ff ff 	and    rax,0xfffffffffffff000
  4010e8:	48 89 c7             	mov    rdi,rax
  4010eb:	48 be 00 00 01 00 00 	movabs rsi,0x10000
  4010f2:	00 00 00 
  4010f5:	48 ba 03 00 00 00 00 	movabs rdx,0x3
  4010fc:	00 00 00 
  4010ff:	48 b8 0a 00 00 00 00 	movabs rax,0xa
  401106:	00 00 00 
  401109:	0f 05                	syscall
  40110b:	48 85 c0             	test   rax,rax
  40110e:	0f 84 16 00 00 00    	je     0x40112a
  401114:	48 bf 8b 00 00 00 00 	movabs rdi,0x8b
  40111b:	00 00 00 
  40111e:	48 b8 3c 00 00 00 00 	movabs rax,0x3c
  401125:	00 00 00 
  401128:	0f 05                	syscall
  40112a:	c3                   	ret
  40112b:	f3 0f 1e fa          	endbr64
  40112f:	48 b8 0f 00 00 00 00 	movabs rax,0xf
  401136:	00 00 00 
  401139:	0f 05                	syscall
  40113b:	48 81 ec a0 00 00 00 	sub    rsp,0xa0
  401142:	48 8d 05 8d ff ff ff 	lea    rax,[rip+0xffffffffffffff8d]        # 0x4010d6
  401149:	48 89 84 24 00 00 00 	mov    QWORD PTR [rsp+0x0],rax
  401150:	00 
  401151:	48 8d 05 d3 ff ff ff 	lea    rax,[rip+0xffffffffffffffd3]        # 0x40112b
  401158:	48 89 84 24 10 00 00 	mov    QWORD PTR [rsp+0x10],rax
  40115f:	00 
  401160:	48 c7 84 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x1c000004
  401167:	00 04 00 00 1c 
  40116c:	48 c7 84 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
  401173:	00 00 00 00 00 
  401178:	48 bf 0b 00 00 00 00 	movabs rdi,0xb
  40117f:	00 00 00 
  401182:	48 89 e6             	mov    rsi,rsp
  401185:	48 31 d2             	xor    rdx,rdx
  401188:	49 ba 08 00 00 00 00 	movabs r10,0x8
  40118f:	00 00 00 
  401192:	48 b8 0d 00 00 00 00 	movabs rax,0xd
  401199:	00 00 00 
  40119c:	0f 05                	syscall
  40119e:	48 81 c4 a0 00 00 00 	add    rsp,0xa0
  4011a5:	5e                   	pop    rsi
  4011a6:	5f                   	pop    rdi
  4011a7:	55                   	push   rbp
  4011a8:	48 89 e5             	mov    rbp,rsp
  4011ab:	48 83 ec 20          	sub    rsp,0x20
  4011af:	48 8d 05 ba 0f 00 00 	lea    rax,[rip+0xfba]        # 0x402170
  4011b6:	48 83 c0 00          	add    rax,0x0
  4011ba:	48 89 85 f8 ff ff ff 	mov    QWORD PTR [rbp-0x8],rax
  4011c1:	48 8b 85 f8 ff ff ff 	mov    rax,QWORD PTR [rbp-0x8]
  4011c8:	48 89 85 f0 ff ff ff 	mov    QWORD PTR [rbp-0x10],rax
  4011cf:	48 8b bd f0 ff ff ff 	mov    rdi,QWORD PTR [rbp-0x10]
  4011d6:	48 b8 00 00 00 00 00 	movabs rax,0x0
  4011dd:	00 00 00 
  4011e0:	e8 47 fe ff ff       	call   0x40102c
  4011e5:	89 85 e8 ff ff ff    	mov    DWORD PTR [rbp-0x18],eax
  4011eb:	48 b8 01 00 00 00 00 	movabs rax,0x1
  4011f2:	00 00 00 
  4011f5:	48 89 ec             	mov    rsp,rbp
  4011f8:	5d                   	pop    rbp
  4011f9:	c3                   	ret

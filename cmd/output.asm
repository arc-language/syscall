
main:     file format elf64-x86-64


Disassembly of section .text:

000000000040102c <.text>:
  40102c:	31 ed                	xor    ebp,ebp
  40102e:	49 89 d1             	mov    r9,rdx
  401031:	5e                   	pop    rsi
  401032:	48 89 e2             	mov    rdx,rsp
  401035:	48 83 e4 f0          	and    rsp,0xfffffffffffffff0
  401039:	48 8d 3d 0c 00 00 00 	lea    rdi,[rip+0xc]        # 0x40104c
  401040:	48 31 c9             	xor    rcx,rcx
  401043:	45 31 c0             	xor    r8d,r8d
  401046:	e8 d1 ff ff ff       	call   0x40101c
  40104b:	f4                   	hlt
  40104c:	57                   	push   rdi
  40104d:	56                   	push   rsi
  40104e:	48 31 ff             	xor    rdi,rdi
  401051:	48 be 00 20 00 00 00 	movabs rsi,0x2000
  401058:	00 00 00 
  40105b:	48 ba 03 00 00 00 00 	movabs rdx,0x3
  401062:	00 00 00 
  401065:	49 ba 22 00 00 00 00 	movabs r10,0x22
  40106c:	00 00 00 
  40106f:	49 b8 ff ff ff ff ff 	movabs r8,0xffffffffffffffff
  401076:	ff ff ff 
  401079:	4d 31 c9             	xor    r9,r9
  40107c:	48 b8 09 00 00 00 00 	movabs rax,0x9
  401083:	00 00 00 
  401086:	0f 05                	syscall
  401088:	48 83 ec 20          	sub    rsp,0x20
  40108c:	48 89 84 24 00 00 00 	mov    QWORD PTR [rsp+0x0],rax
  401093:	00 
  401094:	c7 84 24 08 00 00 00 	mov    DWORD PTR [rsp+0x8],0x0
  40109b:	00 00 00 00 
  40109f:	48 c7 84 24 10 00 00 	mov    QWORD PTR [rsp+0x10],0x2000
  4010a6:	00 00 20 00 00 
  4010ab:	48 89 e7             	mov    rdi,rsp
  4010ae:	48 31 f6             	xor    rsi,rsi
  4010b1:	48 b8 83 00 00 00 00 	movabs rax,0x83
  4010b8:	00 00 00 
  4010bb:	0f 05                	syscall
  4010bd:	48 83 c4 20          	add    rsp,0x20
  4010c1:	e9 65 00 00 00       	jmp    0x40112b
  4010c6:	f3 0f 1e fa          	endbr64
  4010ca:	48 8b 86 10 00 00 00 	mov    rax,QWORD PTR [rsi+0x10]
  4010d1:	48 81 e0 00 f0 ff ff 	and    rax,0xfffffffffffff000
  4010d8:	48 89 c7             	mov    rdi,rax
  4010db:	48 be 00 00 01 00 00 	movabs rsi,0x10000
  4010e2:	00 00 00 
  4010e5:	48 ba 03 00 00 00 00 	movabs rdx,0x3
  4010ec:	00 00 00 
  4010ef:	48 b8 0a 00 00 00 00 	movabs rax,0xa
  4010f6:	00 00 00 
  4010f9:	0f 05                	syscall
  4010fb:	48 85 c0             	test   rax,rax
  4010fe:	0f 84 16 00 00 00    	je     0x40111a
  401104:	48 bf 8b 00 00 00 00 	movabs rdi,0x8b
  40110b:	00 00 00 
  40110e:	48 b8 3c 00 00 00 00 	movabs rax,0x3c
  401115:	00 00 00 
  401118:	0f 05                	syscall
  40111a:	c3                   	ret
  40111b:	f3 0f 1e fa          	endbr64
  40111f:	48 b8 0f 00 00 00 00 	movabs rax,0xf
  401126:	00 00 00 
  401129:	0f 05                	syscall
  40112b:	48 81 ec a0 00 00 00 	sub    rsp,0xa0
  401132:	48 8d 05 8d ff ff ff 	lea    rax,[rip+0xffffffffffffff8d]        # 0x4010c6
  401139:	48 89 84 24 00 00 00 	mov    QWORD PTR [rsp+0x0],rax
  401140:	00 
  401141:	48 8d 05 d3 ff ff ff 	lea    rax,[rip+0xffffffffffffffd3]        # 0x40111b
  401148:	48 89 84 24 10 00 00 	mov    QWORD PTR [rsp+0x10],rax
  40114f:	00 
  401150:	48 c7 84 24 08 00 00 	mov    QWORD PTR [rsp+0x8],0x1c000004
  401157:	00 04 00 00 1c 
  40115c:	48 c7 84 24 18 00 00 	mov    QWORD PTR [rsp+0x18],0x0
  401163:	00 00 00 00 00 
  401168:	48 bf 0b 00 00 00 00 	movabs rdi,0xb
  40116f:	00 00 00 
  401172:	48 89 e6             	mov    rsi,rsp
  401175:	48 31 d2             	xor    rdx,rdx
  401178:	49 ba 08 00 00 00 00 	movabs r10,0x8
  40117f:	00 00 00 
  401182:	48 b8 0d 00 00 00 00 	movabs rax,0xd
  401189:	00 00 00 
  40118c:	0f 05                	syscall
  40118e:	48 81 c4 a0 00 00 00 	add    rsp,0xa0
  401195:	5e                   	pop    rsi
  401196:	5f                   	pop    rdi
  401197:	55                   	push   rbp
  401198:	48 89 e5             	mov    rbp,rsp
  40119b:	48 81 ec 70 01 00 00 	sub    rsp,0x170
  4011a2:	48 8d 05 87 0f 00 00 	lea    rax,[rip+0xf87]        # 0x402130
  4011a9:	48 83 c0 00          	add    rax,0x0
  4011ad:	48 89 85 f8 ff ff ff 	mov    QWORD PTR [rbp-0x8],rax
  4011b4:	48 8d 8d ec ff ff ff 	lea    rcx,[rbp-0x14]
  4011bb:	48 8b 85 f0 ff ff ff 	mov    rax,QWORD PTR [rbp-0x10]
  4011c2:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  4011c9:	48 8d 8d d8 ff ff ff 	lea    rcx,[rbp-0x28]
  4011d0:	48 8b 85 e0 ff ff ff 	mov    rax,QWORD PTR [rbp-0x20]
  4011d7:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  4011de:	48 8d 8d d8 ff ff ff 	lea    rcx,[rbp-0x28]
  4011e5:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  4011ec:	48 89 85 d0 ff ff ff 	mov    QWORD PTR [rbp-0x30],rax
  4011f3:	48 8b 85 d0 ff ff ff 	mov    rax,QWORD PTR [rbp-0x30]
  4011fa:	48 31 c9             	xor    rcx,rcx
  4011fd:	48 39 c8             	cmp    rax,rcx
  401200:	0f 95 c0             	setne  al
  401203:	48 0f b6 c0          	movzx  rax,al
  401207:	88 85 c8 ff ff ff    	mov    BYTE PTR [rbp-0x38],al
  40120d:	48 0f be 85 c8 ff ff 	movsx  rax,BYTE PTR [rbp-0x38]
  401214:	ff 
  401215:	48 85 c0             	test   rax,rax
  401218:	0f 84 05 00 00 00    	je     0x401223
  40121e:	e9 42 00 00 00       	jmp    0x401265
  401223:	48 8d 8d ec ff ff ff 	lea    rcx,[rbp-0x14]
  40122a:	8b 81 00 00 00 00    	mov    eax,DWORD PTR [rcx+0x0]
  401230:	89 85 c0 ff ff ff    	mov    DWORD PTR [rbp-0x40],eax
  401236:	8b 85 c0 ff ff ff    	mov    eax,DWORD PTR [rbp-0x40]
  40123c:	48 31 c9             	xor    rcx,rcx
  40123f:	48 39 c8             	cmp    rax,rcx
  401242:	0f 94 c0             	sete   al
  401245:	48 0f b6 c0          	movzx  rax,al
  401249:	88 85 b8 ff ff ff    	mov    BYTE PTR [rbp-0x48],al
  40124f:	48 0f be 85 b8 ff ff 	movsx  rax,BYTE PTR [rbp-0x48]
  401256:	ff 
  401257:	48 85 c0             	test   rax,rax
  40125a:	0f 84 3b 00 00 00    	je     0x40129b
  401260:	e9 ee 00 00 00       	jmp    0x401353
  401265:	48 8d 05 e4 0e 00 00 	lea    rax,[rip+0xee4]        # 0x402150
  40126c:	48 83 c0 00          	add    rax,0x0
  401270:	48 89 85 b0 ff ff ff 	mov    QWORD PTR [rbp-0x50],rax
  401277:	48 8d 8d d8 ff ff ff 	lea    rcx,[rbp-0x28]
  40127e:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  401285:	48 89 85 a8 ff ff ff 	mov    QWORD PTR [rbp-0x58],rax
  40128c:	48 b8 01 00 00 00 00 	movabs rax,0x1
  401293:	00 00 00 
  401296:	48 89 ec             	mov    rsp,rbp
  401299:	5d                   	pop    rbp
  40129a:	c3                   	ret
  40129b:	48 8d 05 1e 0f 00 00 	lea    rax,[rip+0xf1e]        # 0x4021c0
  4012a2:	48 83 c0 00          	add    rax,0x0
  4012a6:	48 89 85 a0 ff ff ff 	mov    QWORD PTR [rbp-0x60],rax
  4012ad:	48 8d 8d ec ff ff ff 	lea    rcx,[rbp-0x14]
  4012b4:	8b 81 00 00 00 00    	mov    eax,DWORD PTR [rcx+0x0]
  4012ba:	89 85 98 ff ff ff    	mov    DWORD PTR [rbp-0x68],eax
  4012c0:	48 8d 8d 8c ff ff ff 	lea    rcx,[rbp-0x74]
  4012c7:	c7 81 00 00 00 00 00 	mov    DWORD PTR [rcx+0x0],0x0
  4012ce:	00 00 00 
  4012d1:	48 8d 8d ec ff ff ff 	lea    rcx,[rbp-0x14]
  4012d8:	8b 81 00 00 00 00    	mov    eax,DWORD PTR [rcx+0x0]
  4012de:	89 85 88 ff ff ff    	mov    DWORD PTR [rbp-0x78],eax
  4012e4:	48 8d 8d 7c ff ff ff 	lea    rcx,[rbp-0x84]
  4012eb:	48 8b 85 80 ff ff ff 	mov    rax,QWORD PTR [rbp-0x80]
  4012f2:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  4012f9:	48 8d 8d 68 ff ff ff 	lea    rcx,[rbp-0x98]
  401300:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  401307:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  40130e:	48 8d 8d 68 ff ff ff 	lea    rcx,[rbp-0x98]
  401315:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  40131c:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
  401323:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  40132a:	48 31 c9             	xor    rcx,rcx
  40132d:	48 39 c8             	cmp    rax,rcx
  401330:	0f 95 c0             	setne  al
  401333:	48 0f b6 c0          	movzx  rax,al
  401337:	88 85 58 ff ff ff    	mov    BYTE PTR [rbp-0xa8],al
  40133d:	48 0f be 85 58 ff ff 	movsx  rax,BYTE PTR [rbp-0xa8]
  401344:	ff 
  401345:	48 85 c0             	test   rax,rax
  401348:	0f 84 9a 01 00 00    	je     0x4014e8
  40134e:	e9 d7 01 00 00       	jmp    0x40152a
  401353:	48 8d 05 16 0e 00 00 	lea    rax,[rip+0xe16]        # 0x402170
  40135a:	48 83 c0 00          	add    rax,0x0
  40135e:	48 89 85 50 ff ff ff 	mov    QWORD PTR [rbp-0xb0],rax
  401365:	48 8d 05 34 0e 00 00 	lea    rax,[rip+0xe34]        # 0x4021a0
  40136c:	48 83 c0 00          	add    rax,0x0
  401370:	48 89 85 48 ff ff ff 	mov    QWORD PTR [rbp-0xb8],rax
  401377:	48 8d 8d 38 ff ff ff 	lea    rcx,[rbp-0xc8]
  40137e:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  401385:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  40138c:	48 8d 8d 38 ff ff ff 	lea    rcx,[rbp-0xc8]
  401393:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  40139a:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
  4013a1:	c6 85 20 ff ff ff 00 	mov    BYTE PTR [rbp-0xe0],0x0
  4013a8:	c6 85 21 ff ff ff 00 	mov    BYTE PTR [rbp-0xdf],0x0
  4013af:	c6 85 22 ff ff ff 00 	mov    BYTE PTR [rbp-0xde],0x0
  4013b6:	c6 85 23 ff ff ff 00 	mov    BYTE PTR [rbp-0xdd],0x0
  4013bd:	c6 85 24 ff ff ff 00 	mov    BYTE PTR [rbp-0xdc],0x0
  4013c4:	c6 85 25 ff ff ff 00 	mov    BYTE PTR [rbp-0xdb],0x0
  4013cb:	c6 85 26 ff ff ff 00 	mov    BYTE PTR [rbp-0xda],0x0
  4013d2:	c6 85 27 ff ff ff 00 	mov    BYTE PTR [rbp-0xd9],0x0
  4013d9:	c6 85 28 ff ff ff 00 	mov    BYTE PTR [rbp-0xd8],0x0
  4013e0:	c6 85 29 ff ff ff 00 	mov    BYTE PTR [rbp-0xd7],0x0
  4013e7:	c6 85 2a ff ff ff 00 	mov    BYTE PTR [rbp-0xd6],0x0
  4013ee:	c6 85 2b ff ff ff 00 	mov    BYTE PTR [rbp-0xd5],0x0
  4013f5:	c6 85 2c ff ff ff 00 	mov    BYTE PTR [rbp-0xd4],0x0
  4013fc:	c6 85 2d ff ff ff 00 	mov    BYTE PTR [rbp-0xd3],0x0
  401403:	c6 85 2e ff ff ff 00 	mov    BYTE PTR [rbp-0xd2],0x0
  40140a:	c6 85 2f ff ff ff 00 	mov    BYTE PTR [rbp-0xd1],0x0
  401411:	48 8b 85 30 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd0]
  401418:	48 89 85 20 ff ff ff 	mov    QWORD PTR [rbp-0xe0],rax
  40141f:	48 31 c0             	xor    rax,rax
  401422:	48 89 85 18 ff ff ff 	mov    QWORD PTR [rbp-0xe8],rax
  401429:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  401430:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
  401437:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  40143e:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  401445:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  40144c:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  401453:	48 8d 8d f0 fe ff ff 	lea    rcx,[rbp-0x110]
  40145a:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  401461:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  401468:	48 8b 85 10 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf0]
  40146f:	48 89 81 08 00 00 00 	mov    QWORD PTR [rcx+0x8],rax
  401476:	48 31 c0             	xor    rax,rax
  401479:	48 89 85 e0 fe ff ff 	mov    QWORD PTR [rbp-0x120],rax
  401480:	48 8d 8d e8 fe ff ff 	lea    rcx,[rbp-0x118]
  401487:	48 8b 85 e0 fe ff ff 	mov    rax,QWORD PTR [rbp-0x120]
  40148e:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  401495:	48 8d 8d 38 ff ff ff 	lea    rcx,[rbp-0xc8]
  40149c:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  4014a3:	48 89 85 d8 fe ff ff 	mov    QWORD PTR [rbp-0x128],rax
  4014aa:	48 8d 85 f0 fe ff ff 	lea    rax,[rbp-0x110]
  4014b1:	48 83 c0 00          	add    rax,0x0
  4014b5:	48 89 85 d0 fe ff ff 	mov    QWORD PTR [rbp-0x130],rax
  4014bc:	48 8d 8d e8 fe ff ff 	lea    rcx,[rbp-0x118]
  4014c3:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  4014ca:	48 89 85 c8 fe ff ff 	mov    QWORD PTR [rbp-0x138],rax
  4014d1:	48 8d 05 d0 0c 00 00 	lea    rax,[rip+0xcd0]        # 0x4021a8
  4014d8:	48 83 c0 00          	add    rax,0x0
  4014dc:	48 89 85 c0 fe ff ff 	mov    QWORD PTR [rbp-0x140],rax
  4014e3:	e9 b3 fd ff ff       	jmp    0x40129b
  4014e8:	48 8d 8d 8c ff ff ff 	lea    rcx,[rbp-0x74]
  4014ef:	8b 81 00 00 00 00    	mov    eax,DWORD PTR [rcx+0x0]
  4014f5:	89 85 b8 fe ff ff    	mov    DWORD PTR [rbp-0x148],eax
  4014fb:	8b 85 b8 fe ff ff    	mov    eax,DWORD PTR [rbp-0x148]
  401501:	48 31 c9             	xor    rcx,rcx
  401504:	48 39 c8             	cmp    rax,rcx
  401507:	0f 94 c0             	sete   al
  40150a:	48 0f b6 c0          	movzx  rax,al
  40150e:	88 85 b0 fe ff ff    	mov    BYTE PTR [rbp-0x150],al
  401514:	48 0f be 85 b0 fe ff 	movsx  rax,BYTE PTR [rbp-0x150]
  40151b:	ff 
  40151c:	48 85 c0             	test   rax,rax
  40151f:	0f 84 26 00 00 00    	je     0x40154b
  401525:	e9 55 00 00 00       	jmp    0x40157f
  40152a:	48 8d 05 b7 0c 00 00 	lea    rax,[rip+0xcb7]        # 0x4021e8
  401531:	48 83 c0 00          	add    rax,0x0
  401535:	48 89 85 a8 fe ff ff 	mov    QWORD PTR [rbp-0x158],rax
  40153c:	48 b8 01 00 00 00 00 	movabs rax,0x1
  401543:	00 00 00 
  401546:	48 89 ec             	mov    rsp,rbp
  401549:	5d                   	pop    rbp
  40154a:	c3                   	ret
  40154b:	48 8d 05 d6 0c 00 00 	lea    rax,[rip+0xcd6]        # 0x402228
  401552:	48 83 c0 00          	add    rax,0x0
  401556:	48 89 85 a0 fe ff ff 	mov    QWORD PTR [rbp-0x160],rax
  40155d:	48 8d 8d 8c ff ff ff 	lea    rcx,[rbp-0x74]
  401564:	8b 81 00 00 00 00    	mov    eax,DWORD PTR [rcx+0x0]
  40156a:	89 85 98 fe ff ff    	mov    DWORD PTR [rbp-0x168],eax
  401570:	48 b8 01 00 00 00 00 	movabs rax,0x1
  401577:	00 00 00 
  40157a:	48 89 ec             	mov    rsp,rbp
  40157d:	5d                   	pop    rbp
  40157e:	c3                   	ret
  40157f:	48 8d 05 7a 0c 00 00 	lea    rax,[rip+0xc7a]        # 0x402200
  401586:	48 83 c0 00          	add    rax,0x0
  40158a:	48 89 85 90 fe ff ff 	mov    QWORD PTR [rbp-0x170],rax
  401591:	48 31 c0             	xor    rax,rax
  401594:	48 89 ec             	mov    rsp,rbp
  401597:	5d                   	pop    rbp
  401598:	c3                   	ret
  401599:	90                   	nop
  40159a:	90                   	nop
  40159b:	90                   	nop
  40159c:	55                   	push   rbp
  40159d:	48 89 e5             	mov    rbp,rsp
  4015a0:	48 81 ec 90 00 00 00 	sub    rsp,0x90
  4015a7:	48 b8 39 00 00 00 00 	movabs rax,0x39
  4015ae:	00 00 00 
  4015b1:	0f 05                	syscall
  4015b3:	48 89 85 f8 ff ff ff 	mov    QWORD PTR [rbp-0x8],rax
  4015ba:	48 8d 8d e8 ff ff ff 	lea    rcx,[rbp-0x18]
  4015c1:	48 8b 85 f8 ff ff ff 	mov    rax,QWORD PTR [rbp-0x8]
  4015c8:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  4015cf:	48 8d 8d e8 ff ff ff 	lea    rcx,[rbp-0x18]
  4015d6:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  4015dd:	48 89 85 e0 ff ff ff 	mov    QWORD PTR [rbp-0x20],rax
  4015e4:	48 8b 85 e0 ff ff ff 	mov    rax,QWORD PTR [rbp-0x20]
  4015eb:	48 31 c9             	xor    rcx,rcx
  4015ee:	48 39 c8             	cmp    rax,rcx
  4015f1:	0f 9c c0             	setl   al
  4015f4:	48 0f b6 c0          	movzx  rax,al
  4015f8:	88 85 d8 ff ff ff    	mov    BYTE PTR [rbp-0x28],al
  4015fe:	48 0f be 85 d8 ff ff 	movsx  rax,BYTE PTR [rbp-0x28]
  401605:	ff 
  401606:	48 85 c0             	test   rax,rax
  401609:	0f 84 05 00 00 00    	je     0x401614
  40160f:	e9 d8 00 00 00       	jmp    0x4016ec
  401614:	48 8d 8d e8 ff ff ff 	lea    rcx,[rbp-0x18]
  40161b:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  401622:	48 89 85 d0 ff ff ff 	mov    QWORD PTR [rbp-0x30],rax
  401629:	48 8b 85 d0 ff ff ff 	mov    rax,QWORD PTR [rbp-0x30]
  401630:	89 85 c8 ff ff ff    	mov    DWORD PTR [rbp-0x38],eax
  401636:	c6 85 b8 ff ff ff 00 	mov    BYTE PTR [rbp-0x48],0x0
  40163d:	c6 85 b9 ff ff ff 00 	mov    BYTE PTR [rbp-0x47],0x0
  401644:	c6 85 ba ff ff ff 00 	mov    BYTE PTR [rbp-0x46],0x0
  40164b:	c6 85 bb ff ff ff 00 	mov    BYTE PTR [rbp-0x45],0x0
  401652:	c6 85 bc ff ff ff 00 	mov    BYTE PTR [rbp-0x44],0x0
  401659:	c6 85 bd ff ff ff 00 	mov    BYTE PTR [rbp-0x43],0x0
  401660:	c6 85 be ff ff ff 00 	mov    BYTE PTR [rbp-0x42],0x0
  401667:	c6 85 bf ff ff ff 00 	mov    BYTE PTR [rbp-0x41],0x0
  40166e:	c6 85 c0 ff ff ff 00 	mov    BYTE PTR [rbp-0x40],0x0
  401675:	c6 85 c1 ff ff ff 00 	mov    BYTE PTR [rbp-0x3f],0x0
  40167c:	c6 85 c2 ff ff ff 00 	mov    BYTE PTR [rbp-0x3e],0x0
  401683:	c6 85 c3 ff ff ff 00 	mov    BYTE PTR [rbp-0x3d],0x0
  40168a:	c6 85 c4 ff ff ff 00 	mov    BYTE PTR [rbp-0x3c],0x0
  401691:	c6 85 c5 ff ff ff 00 	mov    BYTE PTR [rbp-0x3b],0x0
  401698:	c6 85 c6 ff ff ff 00 	mov    BYTE PTR [rbp-0x3a],0x0
  40169f:	c6 85 c7 ff ff ff 00 	mov    BYTE PTR [rbp-0x39],0x0
  4016a6:	8b 85 c8 ff ff ff    	mov    eax,DWORD PTR [rbp-0x38]
  4016ac:	89 85 b8 ff ff ff    	mov    DWORD PTR [rbp-0x48],eax
  4016b2:	48 8b 85 b8 ff ff ff 	mov    rax,QWORD PTR [rbp-0x48]
  4016b9:	48 89 85 a8 ff ff ff 	mov    QWORD PTR [rbp-0x58],rax
  4016c0:	48 8b 85 c0 ff ff ff 	mov    rax,QWORD PTR [rbp-0x40]
  4016c7:	48 89 85 b0 ff ff ff 	mov    QWORD PTR [rbp-0x50],rax
  4016ce:	48 c7 85 b0 ff ff ff 	mov    QWORD PTR [rbp-0x50],0x0
  4016d5:	00 00 00 00 
  4016d9:	48 8b 85 a8 ff ff ff 	mov    rax,QWORD PTR [rbp-0x58]
  4016e0:	48 8b 95 b0 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x50]
  4016e7:	48 89 ec             	mov    rsp,rbp
  4016ea:	5d                   	pop    rbp
  4016eb:	c3                   	ret
  4016ec:	48 8d 8d e8 ff ff ff 	lea    rcx,[rbp-0x18]
  4016f3:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  4016fa:	48 89 85 a0 ff ff ff 	mov    QWORD PTR [rbp-0x60],rax
  401701:	48 31 c0             	xor    rax,rax
  401704:	48 8b 8d a0 ff ff ff 	mov    rcx,QWORD PTR [rbp-0x60]
  40170b:	48 29 c8             	sub    rax,rcx
  40170e:	48 89 85 98 ff ff ff 	mov    QWORD PTR [rbp-0x68],rax
  401715:	c6 85 88 ff ff ff 00 	mov    BYTE PTR [rbp-0x78],0x0
  40171c:	c6 85 89 ff ff ff 00 	mov    BYTE PTR [rbp-0x77],0x0
  401723:	c6 85 8a ff ff ff 00 	mov    BYTE PTR [rbp-0x76],0x0
  40172a:	c6 85 8b ff ff ff 00 	mov    BYTE PTR [rbp-0x75],0x0
  401731:	c6 85 8c ff ff ff 00 	mov    BYTE PTR [rbp-0x74],0x0
  401738:	c6 85 8d ff ff ff 00 	mov    BYTE PTR [rbp-0x73],0x0
  40173f:	c6 85 8e ff ff ff 00 	mov    BYTE PTR [rbp-0x72],0x0
  401746:	c6 85 8f ff ff ff 00 	mov    BYTE PTR [rbp-0x71],0x0
  40174d:	c6 85 90 ff ff ff 00 	mov    BYTE PTR [rbp-0x70],0x0
  401754:	c6 85 91 ff ff ff 00 	mov    BYTE PTR [rbp-0x6f],0x0
  40175b:	c6 85 92 ff ff ff 00 	mov    BYTE PTR [rbp-0x6e],0x0
  401762:	c6 85 93 ff ff ff 00 	mov    BYTE PTR [rbp-0x6d],0x0
  401769:	c6 85 94 ff ff ff 00 	mov    BYTE PTR [rbp-0x6c],0x0
  401770:	c6 85 95 ff ff ff 00 	mov    BYTE PTR [rbp-0x6b],0x0
  401777:	c6 85 96 ff ff ff 00 	mov    BYTE PTR [rbp-0x6a],0x0
  40177e:	c6 85 97 ff ff ff 00 	mov    BYTE PTR [rbp-0x69],0x0
  401785:	c7 85 88 ff ff ff ff 	mov    DWORD PTR [rbp-0x78],0xffffffff
  40178c:	ff ff ff 
  40178f:	48 8b 85 88 ff ff ff 	mov    rax,QWORD PTR [rbp-0x78]
  401796:	48 89 85 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rax
  40179d:	48 8b 85 90 ff ff ff 	mov    rax,QWORD PTR [rbp-0x70]
  4017a4:	48 89 85 80 ff ff ff 	mov    QWORD PTR [rbp-0x80],rax
  4017ab:	48 8b 85 98 ff ff ff 	mov    rax,QWORD PTR [rbp-0x68]
  4017b2:	48 89 85 80 ff ff ff 	mov    QWORD PTR [rbp-0x80],rax
  4017b9:	48 8b 85 78 ff ff ff 	mov    rax,QWORD PTR [rbp-0x88]
  4017c0:	48 8b 95 80 ff ff ff 	mov    rdx,QWORD PTR [rbp-0x80]
  4017c7:	48 89 ec             	mov    rsp,rbp
  4017ca:	5d                   	pop    rbp
  4017cb:	c3                   	ret
  4017cc:	55                   	push   rbp
  4017cd:	48 89 e5             	mov    rbp,rsp
  4017d0:	48 81 ec 00 01 00 00 	sub    rsp,0x100
  4017d7:	48 89 bd f8 ff ff ff 	mov    QWORD PTR [rbp-0x8],rdi
  4017de:	48 89 b5 f0 ff ff ff 	mov    QWORD PTR [rbp-0x10],rsi
  4017e5:	48 89 95 e8 ff ff ff 	mov    QWORD PTR [rbp-0x18],rdx
  4017ec:	48 89 8d e0 ff ff ff 	mov    QWORD PTR [rbp-0x20],rcx
  4017f3:	48 8d 8d dc ff ff ff 	lea    rcx,[rbp-0x24]
  4017fa:	8b 85 f8 ff ff ff    	mov    eax,DWORD PTR [rbp-0x8]
  401800:	89 81 00 00 00 00    	mov    DWORD PTR [rcx+0x0],eax
  401806:	48 8d 8d c8 ff ff ff 	lea    rcx,[rbp-0x38]
  40180d:	48 8b 85 f0 ff ff ff 	mov    rax,QWORD PTR [rbp-0x10]
  401814:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  40181b:	48 8d 8d bc ff ff ff 	lea    rcx,[rbp-0x44]
  401822:	8b 85 e8 ff ff ff    	mov    eax,DWORD PTR [rbp-0x18]
  401828:	89 81 00 00 00 00    	mov    DWORD PTR [rcx+0x0],eax
  40182e:	48 8d 8d a8 ff ff ff 	lea    rcx,[rbp-0x58]
  401835:	48 8b 85 e0 ff ff ff 	mov    rax,QWORD PTR [rbp-0x20]
  40183c:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  401843:	48 8d 8d dc ff ff ff 	lea    rcx,[rbp-0x24]
  40184a:	8b 81 00 00 00 00    	mov    eax,DWORD PTR [rcx+0x0]
  401850:	89 85 a0 ff ff ff    	mov    DWORD PTR [rbp-0x60],eax
  401856:	48 8d 8d c8 ff ff ff 	lea    rcx,[rbp-0x38]
  40185d:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  401864:	48 89 85 98 ff ff ff 	mov    QWORD PTR [rbp-0x68],rax
  40186b:	48 8d 8d bc ff ff ff 	lea    rcx,[rbp-0x44]
  401872:	8b 81 00 00 00 00    	mov    eax,DWORD PTR [rcx+0x0]
  401878:	89 85 90 ff ff ff    	mov    DWORD PTR [rbp-0x70],eax
  40187e:	48 8d 8d a8 ff ff ff 	lea    rcx,[rbp-0x58]
  401885:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  40188c:	48 89 85 88 ff ff ff 	mov    QWORD PTR [rbp-0x78],rax
  401893:	48 b8 3d 00 00 00 00 	movabs rax,0x3d
  40189a:	00 00 00 
  40189d:	8b bd a0 ff ff ff    	mov    edi,DWORD PTR [rbp-0x60]
  4018a3:	48 8b b5 98 ff ff ff 	mov    rsi,QWORD PTR [rbp-0x68]
  4018aa:	8b 95 90 ff ff ff    	mov    edx,DWORD PTR [rbp-0x70]
  4018b0:	4c 8b 95 88 ff ff ff 	mov    r10,QWORD PTR [rbp-0x78]
  4018b7:	0f 05                	syscall
  4018b9:	48 89 85 80 ff ff ff 	mov    QWORD PTR [rbp-0x80],rax
  4018c0:	48 8d 8d 78 ff ff ff 	lea    rcx,[rbp-0x88]
  4018c7:	48 8b 85 80 ff ff ff 	mov    rax,QWORD PTR [rbp-0x80]
  4018ce:	48 89 81 00 00 00 00 	mov    QWORD PTR [rcx+0x0],rax
  4018d5:	48 8d 8d 78 ff ff ff 	lea    rcx,[rbp-0x88]
  4018dc:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  4018e3:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
  4018ea:	48 8b 85 70 ff ff ff 	mov    rax,QWORD PTR [rbp-0x90]
  4018f1:	48 31 c9             	xor    rcx,rcx
  4018f4:	48 39 c8             	cmp    rax,rcx
  4018f7:	0f 9c c0             	setl   al
  4018fa:	48 0f b6 c0          	movzx  rax,al
  4018fe:	88 85 68 ff ff ff    	mov    BYTE PTR [rbp-0x98],al
  401904:	48 0f be 85 68 ff ff 	movsx  rax,BYTE PTR [rbp-0x98]
  40190b:	ff 
  40190c:	48 85 c0             	test   rax,rax
  40190f:	0f 84 05 00 00 00    	je     0x40191a
  401915:	e9 d8 00 00 00       	jmp    0x4019f2
  40191a:	48 8d 8d 78 ff ff ff 	lea    rcx,[rbp-0x88]
  401921:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  401928:	48 89 85 60 ff ff ff 	mov    QWORD PTR [rbp-0xa0],rax
  40192f:	48 8b 85 60 ff ff ff 	mov    rax,QWORD PTR [rbp-0xa0]
  401936:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
  40193c:	c6 85 48 ff ff ff 00 	mov    BYTE PTR [rbp-0xb8],0x0
  401943:	c6 85 49 ff ff ff 00 	mov    BYTE PTR [rbp-0xb7],0x0
  40194a:	c6 85 4a ff ff ff 00 	mov    BYTE PTR [rbp-0xb6],0x0
  401951:	c6 85 4b ff ff ff 00 	mov    BYTE PTR [rbp-0xb5],0x0
  401958:	c6 85 4c ff ff ff 00 	mov    BYTE PTR [rbp-0xb4],0x0
  40195f:	c6 85 4d ff ff ff 00 	mov    BYTE PTR [rbp-0xb3],0x0
  401966:	c6 85 4e ff ff ff 00 	mov    BYTE PTR [rbp-0xb2],0x0
  40196d:	c6 85 4f ff ff ff 00 	mov    BYTE PTR [rbp-0xb1],0x0
  401974:	c6 85 50 ff ff ff 00 	mov    BYTE PTR [rbp-0xb0],0x0
  40197b:	c6 85 51 ff ff ff 00 	mov    BYTE PTR [rbp-0xaf],0x0
  401982:	c6 85 52 ff ff ff 00 	mov    BYTE PTR [rbp-0xae],0x0
  401989:	c6 85 53 ff ff ff 00 	mov    BYTE PTR [rbp-0xad],0x0
  401990:	c6 85 54 ff ff ff 00 	mov    BYTE PTR [rbp-0xac],0x0
  401997:	c6 85 55 ff ff ff 00 	mov    BYTE PTR [rbp-0xab],0x0
  40199e:	c6 85 56 ff ff ff 00 	mov    BYTE PTR [rbp-0xaa],0x0
  4019a5:	c6 85 57 ff ff ff 00 	mov    BYTE PTR [rbp-0xa9],0x0
  4019ac:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  4019b2:	89 85 48 ff ff ff    	mov    DWORD PTR [rbp-0xb8],eax
  4019b8:	48 8b 85 48 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb8]
  4019bf:	48 89 85 38 ff ff ff 	mov    QWORD PTR [rbp-0xc8],rax
  4019c6:	48 8b 85 50 ff ff ff 	mov    rax,QWORD PTR [rbp-0xb0]
  4019cd:	48 89 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],rax
  4019d4:	48 c7 85 40 ff ff ff 	mov    QWORD PTR [rbp-0xc0],0x0
  4019db:	00 00 00 00 
  4019df:	48 8b 85 38 ff ff ff 	mov    rax,QWORD PTR [rbp-0xc8]
  4019e6:	48 8b 95 40 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xc0]
  4019ed:	48 89 ec             	mov    rsp,rbp
  4019f0:	5d                   	pop    rbp
  4019f1:	c3                   	ret
  4019f2:	48 8d 8d 78 ff ff ff 	lea    rcx,[rbp-0x88]
  4019f9:	48 8b 81 00 00 00 00 	mov    rax,QWORD PTR [rcx+0x0]
  401a00:	48 89 85 30 ff ff ff 	mov    QWORD PTR [rbp-0xd0],rax
  401a07:	48 31 c0             	xor    rax,rax
  401a0a:	48 8b 8d 30 ff ff ff 	mov    rcx,QWORD PTR [rbp-0xd0]
  401a11:	48 29 c8             	sub    rax,rcx
  401a14:	48 89 85 28 ff ff ff 	mov    QWORD PTR [rbp-0xd8],rax
  401a1b:	c6 85 18 ff ff ff 00 	mov    BYTE PTR [rbp-0xe8],0x0
  401a22:	c6 85 19 ff ff ff 00 	mov    BYTE PTR [rbp-0xe7],0x0
  401a29:	c6 85 1a ff ff ff 00 	mov    BYTE PTR [rbp-0xe6],0x0
  401a30:	c6 85 1b ff ff ff 00 	mov    BYTE PTR [rbp-0xe5],0x0
  401a37:	c6 85 1c ff ff ff 00 	mov    BYTE PTR [rbp-0xe4],0x0
  401a3e:	c6 85 1d ff ff ff 00 	mov    BYTE PTR [rbp-0xe3],0x0
  401a45:	c6 85 1e ff ff ff 00 	mov    BYTE PTR [rbp-0xe2],0x0
  401a4c:	c6 85 1f ff ff ff 00 	mov    BYTE PTR [rbp-0xe1],0x0
  401a53:	c6 85 20 ff ff ff 00 	mov    BYTE PTR [rbp-0xe0],0x0
  401a5a:	c6 85 21 ff ff ff 00 	mov    BYTE PTR [rbp-0xdf],0x0
  401a61:	c6 85 22 ff ff ff 00 	mov    BYTE PTR [rbp-0xde],0x0
  401a68:	c6 85 23 ff ff ff 00 	mov    BYTE PTR [rbp-0xdd],0x0
  401a6f:	c6 85 24 ff ff ff 00 	mov    BYTE PTR [rbp-0xdc],0x0
  401a76:	c6 85 25 ff ff ff 00 	mov    BYTE PTR [rbp-0xdb],0x0
  401a7d:	c6 85 26 ff ff ff 00 	mov    BYTE PTR [rbp-0xda],0x0
  401a84:	c6 85 27 ff ff ff 00 	mov    BYTE PTR [rbp-0xd9],0x0
  401a8b:	c7 85 18 ff ff ff ff 	mov    DWORD PTR [rbp-0xe8],0xffffffff
  401a92:	ff ff ff 
  401a95:	48 8b 85 18 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe8]
  401a9c:	48 89 85 08 ff ff ff 	mov    QWORD PTR [rbp-0xf8],rax
  401aa3:	48 8b 85 20 ff ff ff 	mov    rax,QWORD PTR [rbp-0xe0]
  401aaa:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  401ab1:	48 8b 85 28 ff ff ff 	mov    rax,QWORD PTR [rbp-0xd8]
  401ab8:	48 89 85 10 ff ff ff 	mov    QWORD PTR [rbp-0xf0],rax
  401abf:	48 8b 85 08 ff ff ff 	mov    rax,QWORD PTR [rbp-0xf8]
  401ac6:	48 8b 95 10 ff ff ff 	mov    rdx,QWORD PTR [rbp-0xf0]
  401acd:	48 89 ec             	mov    rsp,rbp
  401ad0:	5d                   	pop    rbp
  401ad1:	c3                   	ret

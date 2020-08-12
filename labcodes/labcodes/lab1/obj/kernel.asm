
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10000b:	2d 16 fa 10 00       	sub    $0x10fa16,%eax
  100010:	89 44 24 08          	mov    %eax,0x8(%esp)
  100014:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001b:	00 
  10001c:	c7 04 24 16 fa 10 00 	movl   $0x10fa16,(%esp)
  100023:	e8 c3 2a 00 00       	call   102aeb <memset>

    cons_init();                // init the console
  100028:	e8 68 15 00 00       	call   101595 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  10002d:	c7 45 f4 e0 32 10 00 	movl   $0x1032e0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100034:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100037:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003b:	c7 04 24 fc 32 10 00 	movl   $0x1032fc,(%esp)
  100042:	e8 11 02 00 00       	call   100258 <cprintf>

    print_kerninfo();
  100047:	e8 a7 08 00 00       	call   1008f3 <print_kerninfo>

    grade_backtrace();
  10004c:	e8 89 00 00 00       	call   1000da <grade_backtrace>

    pmm_init();                 // init physical memory management
  100051:	e8 6c 27 00 00       	call   1027c2 <pmm_init>

    pic_init();                 // init interrupt controller
  100056:	e8 7b 16 00 00       	call   1016d6 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005b:	e8 eb 17 00 00       	call   10184b <idt_init>

    clock_init();               // init clock interrupt
  100060:	e8 f1 0c 00 00       	call   100d56 <clock_init>
    intr_enable();              // enable irq interrupt
  100065:	e8 b4 17 00 00       	call   10181e <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006a:	eb fe                	jmp    10006a <kern_init+0x6a>

0010006c <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  10006c:	55                   	push   %ebp
  10006d:	89 e5                	mov    %esp,%ebp
  10006f:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100072:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100079:	00 
  10007a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100081:	00 
  100082:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100089:	e8 b6 0c 00 00       	call   100d44 <mon_backtrace>
}
  10008e:	90                   	nop
  10008f:	c9                   	leave  
  100090:	c3                   	ret    

00100091 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100091:	55                   	push   %ebp
  100092:	89 e5                	mov    %esp,%ebp
  100094:	53                   	push   %ebx
  100095:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  100098:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  10009b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10009e:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000a8:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000ac:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b0:	89 04 24             	mov    %eax,(%esp)
  1000b3:	e8 b4 ff ff ff       	call   10006c <grade_backtrace2>
}
  1000b8:	90                   	nop
  1000b9:	83 c4 14             	add    $0x14,%esp
  1000bc:	5b                   	pop    %ebx
  1000bd:	5d                   	pop    %ebp
  1000be:	c3                   	ret    

001000bf <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000bf:	55                   	push   %ebp
  1000c0:	89 e5                	mov    %esp,%ebp
  1000c2:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c5:	8b 45 10             	mov    0x10(%ebp),%eax
  1000c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000cc:	8b 45 08             	mov    0x8(%ebp),%eax
  1000cf:	89 04 24             	mov    %eax,(%esp)
  1000d2:	e8 ba ff ff ff       	call   100091 <grade_backtrace1>
}
  1000d7:	90                   	nop
  1000d8:	c9                   	leave  
  1000d9:	c3                   	ret    

001000da <grade_backtrace>:

void
grade_backtrace(void) {
  1000da:	55                   	push   %ebp
  1000db:	89 e5                	mov    %esp,%ebp
  1000dd:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e0:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e5:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ec:	ff 
  1000ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f8:	e8 c2 ff ff ff       	call   1000bf <grade_backtrace0>
}
  1000fd:	90                   	nop
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	83 e0 03             	and    $0x3,%eax
  100119:	89 c2                	mov    %eax,%edx
  10011b:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  100120:	89 54 24 08          	mov    %edx,0x8(%esp)
  100124:	89 44 24 04          	mov    %eax,0x4(%esp)
  100128:	c7 04 24 01 33 10 00 	movl   $0x103301,(%esp)
  10012f:	e8 24 01 00 00       	call   100258 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100134:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100138:	89 c2                	mov    %eax,%edx
  10013a:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10013f:	89 54 24 08          	mov    %edx,0x8(%esp)
  100143:	89 44 24 04          	mov    %eax,0x4(%esp)
  100147:	c7 04 24 0f 33 10 00 	movl   $0x10330f,(%esp)
  10014e:	e8 05 01 00 00       	call   100258 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100153:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100157:	89 c2                	mov    %eax,%edx
  100159:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10015e:	89 54 24 08          	mov    %edx,0x8(%esp)
  100162:	89 44 24 04          	mov    %eax,0x4(%esp)
  100166:	c7 04 24 1d 33 10 00 	movl   $0x10331d,(%esp)
  10016d:	e8 e6 00 00 00       	call   100258 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100172:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100176:	89 c2                	mov    %eax,%edx
  100178:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10017d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100181:	89 44 24 04          	mov    %eax,0x4(%esp)
  100185:	c7 04 24 2b 33 10 00 	movl   $0x10332b,(%esp)
  10018c:	e8 c7 00 00 00       	call   100258 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100191:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  100195:	89 c2                	mov    %eax,%edx
  100197:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  10019c:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001a4:	c7 04 24 39 33 10 00 	movl   $0x103339,(%esp)
  1001ab:	e8 a8 00 00 00       	call   100258 <cprintf>
    round ++;
  1001b0:	a1 20 fa 10 00       	mov    0x10fa20,%eax
  1001b5:	40                   	inc    %eax
  1001b6:	a3 20 fa 10 00       	mov    %eax,0x10fa20
}
  1001bb:	90                   	nop
  1001bc:	c9                   	leave  
  1001bd:	c3                   	ret    

001001be <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001be:	55                   	push   %ebp
  1001bf:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c1:	90                   	nop
  1001c2:	5d                   	pop    %ebp
  1001c3:	c3                   	ret    

001001c4 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001c4:	55                   	push   %ebp
  1001c5:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001c7:	90                   	nop
  1001c8:	5d                   	pop    %ebp
  1001c9:	c3                   	ret    

001001ca <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001ca:	55                   	push   %ebp
  1001cb:	89 e5                	mov    %esp,%ebp
  1001cd:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d0:	e8 2b ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001d5:	c7 04 24 48 33 10 00 	movl   $0x103348,(%esp)
  1001dc:	e8 77 00 00 00       	call   100258 <cprintf>
    lab1_switch_to_user();
  1001e1:	e8 d8 ff ff ff       	call   1001be <lab1_switch_to_user>
    lab1_print_cur_status();
  1001e6:	e8 15 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001eb:	c7 04 24 68 33 10 00 	movl   $0x103368,(%esp)
  1001f2:	e8 61 00 00 00       	call   100258 <cprintf>
    lab1_switch_to_kernel();
  1001f7:	e8 c8 ff ff ff       	call   1001c4 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  1001fc:	e8 ff fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100201:	90                   	nop
  100202:	c9                   	leave  
  100203:	c3                   	ret    

00100204 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100204:	55                   	push   %ebp
  100205:	89 e5                	mov    %esp,%ebp
  100207:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10020a:	8b 45 08             	mov    0x8(%ebp),%eax
  10020d:	89 04 24             	mov    %eax,(%esp)
  100210:	e8 ad 13 00 00       	call   1015c2 <cons_putc>
    (*cnt) ++;
  100215:	8b 45 0c             	mov    0xc(%ebp),%eax
  100218:	8b 00                	mov    (%eax),%eax
  10021a:	8d 50 01             	lea    0x1(%eax),%edx
  10021d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100220:	89 10                	mov    %edx,(%eax)
}
  100222:	90                   	nop
  100223:	c9                   	leave  
  100224:	c3                   	ret    

00100225 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100225:	55                   	push   %ebp
  100226:	89 e5                	mov    %esp,%ebp
  100228:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10022b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100232:	8b 45 0c             	mov    0xc(%ebp),%eax
  100235:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100239:	8b 45 08             	mov    0x8(%ebp),%eax
  10023c:	89 44 24 08          	mov    %eax,0x8(%esp)
  100240:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100243:	89 44 24 04          	mov    %eax,0x4(%esp)
  100247:	c7 04 24 04 02 10 00 	movl   $0x100204,(%esp)
  10024e:	e8 e4 2b 00 00       	call   102e37 <vprintfmt>
    return cnt;
  100253:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100256:	c9                   	leave  
  100257:	c3                   	ret    

00100258 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100258:	55                   	push   %ebp
  100259:	89 e5                	mov    %esp,%ebp
  10025b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10025e:	8d 45 0c             	lea    0xc(%ebp),%eax
  100261:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100264:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100267:	89 44 24 04          	mov    %eax,0x4(%esp)
  10026b:	8b 45 08             	mov    0x8(%ebp),%eax
  10026e:	89 04 24             	mov    %eax,(%esp)
  100271:	e8 af ff ff ff       	call   100225 <vcprintf>
  100276:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100279:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10027c:	c9                   	leave  
  10027d:	c3                   	ret    

0010027e <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  10027e:	55                   	push   %ebp
  10027f:	89 e5                	mov    %esp,%ebp
  100281:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100284:	8b 45 08             	mov    0x8(%ebp),%eax
  100287:	89 04 24             	mov    %eax,(%esp)
  10028a:	e8 33 13 00 00       	call   1015c2 <cons_putc>
}
  10028f:	90                   	nop
  100290:	c9                   	leave  
  100291:	c3                   	ret    

00100292 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  100292:	55                   	push   %ebp
  100293:	89 e5                	mov    %esp,%ebp
  100295:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100298:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  10029f:	eb 13                	jmp    1002b4 <cputs+0x22>
        cputch(c, &cnt);
  1002a1:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002a5:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002a8:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002ac:	89 04 24             	mov    %eax,(%esp)
  1002af:	e8 50 ff ff ff       	call   100204 <cputch>
    while ((c = *str ++) != '\0') {
  1002b4:	8b 45 08             	mov    0x8(%ebp),%eax
  1002b7:	8d 50 01             	lea    0x1(%eax),%edx
  1002ba:	89 55 08             	mov    %edx,0x8(%ebp)
  1002bd:	0f b6 00             	movzbl (%eax),%eax
  1002c0:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002c3:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002c7:	75 d8                	jne    1002a1 <cputs+0xf>
    }
    cputch('\n', &cnt);
  1002c9:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002cc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002d0:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002d7:	e8 28 ff ff ff       	call   100204 <cputch>
    return cnt;
  1002dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002df:	c9                   	leave  
  1002e0:	c3                   	ret    

001002e1 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002e1:	55                   	push   %ebp
  1002e2:	89 e5                	mov    %esp,%ebp
  1002e4:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002e7:	90                   	nop
  1002e8:	e8 ff 12 00 00       	call   1015ec <cons_getc>
  1002ed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1002f0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1002f4:	74 f2                	je     1002e8 <getchar+0x7>
        /* do nothing */;
    return c;
  1002f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002f9:	c9                   	leave  
  1002fa:	c3                   	ret    

001002fb <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  1002fb:	55                   	push   %ebp
  1002fc:	89 e5                	mov    %esp,%ebp
  1002fe:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100301:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100305:	74 13                	je     10031a <readline+0x1f>
        cprintf("%s", prompt);
  100307:	8b 45 08             	mov    0x8(%ebp),%eax
  10030a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10030e:	c7 04 24 87 33 10 00 	movl   $0x103387,(%esp)
  100315:	e8 3e ff ff ff       	call   100258 <cprintf>
    }
    int i = 0, c;
  10031a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100321:	e8 bb ff ff ff       	call   1002e1 <getchar>
  100326:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100329:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10032d:	79 07                	jns    100336 <readline+0x3b>
            return NULL;
  10032f:	b8 00 00 00 00       	mov    $0x0,%eax
  100334:	eb 78                	jmp    1003ae <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100336:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10033a:	7e 28                	jle    100364 <readline+0x69>
  10033c:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100343:	7f 1f                	jg     100364 <readline+0x69>
            cputchar(c);
  100345:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100348:	89 04 24             	mov    %eax,(%esp)
  10034b:	e8 2e ff ff ff       	call   10027e <cputchar>
            buf[i ++] = c;
  100350:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100353:	8d 50 01             	lea    0x1(%eax),%edx
  100356:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100359:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10035c:	88 90 40 fa 10 00    	mov    %dl,0x10fa40(%eax)
  100362:	eb 45                	jmp    1003a9 <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100364:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100368:	75 16                	jne    100380 <readline+0x85>
  10036a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10036e:	7e 10                	jle    100380 <readline+0x85>
            cputchar(c);
  100370:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100373:	89 04 24             	mov    %eax,(%esp)
  100376:	e8 03 ff ff ff       	call   10027e <cputchar>
            i --;
  10037b:	ff 4d f4             	decl   -0xc(%ebp)
  10037e:	eb 29                	jmp    1003a9 <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100380:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100384:	74 06                	je     10038c <readline+0x91>
  100386:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10038a:	75 95                	jne    100321 <readline+0x26>
            cputchar(c);
  10038c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10038f:	89 04 24             	mov    %eax,(%esp)
  100392:	e8 e7 fe ff ff       	call   10027e <cputchar>
            buf[i] = '\0';
  100397:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10039a:	05 40 fa 10 00       	add    $0x10fa40,%eax
  10039f:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003a2:	b8 40 fa 10 00       	mov    $0x10fa40,%eax
  1003a7:	eb 05                	jmp    1003ae <readline+0xb3>
        c = getchar();
  1003a9:	e9 73 ff ff ff       	jmp    100321 <readline+0x26>
        }
    }
}
  1003ae:	c9                   	leave  
  1003af:	c3                   	ret    

001003b0 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003b0:	55                   	push   %ebp
  1003b1:	89 e5                	mov    %esp,%ebp
  1003b3:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003b6:	a1 40 fe 10 00       	mov    0x10fe40,%eax
  1003bb:	85 c0                	test   %eax,%eax
  1003bd:	75 5b                	jne    10041a <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1003bf:	c7 05 40 fe 10 00 01 	movl   $0x1,0x10fe40
  1003c6:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003c9:	8d 45 14             	lea    0x14(%ebp),%eax
  1003cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003d2:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1003d9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003dd:	c7 04 24 8a 33 10 00 	movl   $0x10338a,(%esp)
  1003e4:	e8 6f fe ff ff       	call   100258 <cprintf>
    vcprintf(fmt, ap);
  1003e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f0:	8b 45 10             	mov    0x10(%ebp),%eax
  1003f3:	89 04 24             	mov    %eax,(%esp)
  1003f6:	e8 2a fe ff ff       	call   100225 <vcprintf>
    cprintf("\n");
  1003fb:	c7 04 24 a6 33 10 00 	movl   $0x1033a6,(%esp)
  100402:	e8 51 fe ff ff       	call   100258 <cprintf>
    
    cprintf("stack trackback:\n");
  100407:	c7 04 24 a8 33 10 00 	movl   $0x1033a8,(%esp)
  10040e:	e8 45 fe ff ff       	call   100258 <cprintf>
    print_stackframe();
  100413:	e8 21 06 00 00       	call   100a39 <print_stackframe>
  100418:	eb 01                	jmp    10041b <__panic+0x6b>
        goto panic_dead;
  10041a:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10041b:	e8 06 14 00 00       	call   101826 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100420:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100427:	e8 4b 08 00 00       	call   100c77 <kmonitor>
  10042c:	eb f2                	jmp    100420 <__panic+0x70>

0010042e <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  10042e:	55                   	push   %ebp
  10042f:	89 e5                	mov    %esp,%ebp
  100431:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100434:	8d 45 14             	lea    0x14(%ebp),%eax
  100437:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10043a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10043d:	89 44 24 08          	mov    %eax,0x8(%esp)
  100441:	8b 45 08             	mov    0x8(%ebp),%eax
  100444:	89 44 24 04          	mov    %eax,0x4(%esp)
  100448:	c7 04 24 ba 33 10 00 	movl   $0x1033ba,(%esp)
  10044f:	e8 04 fe ff ff       	call   100258 <cprintf>
    vcprintf(fmt, ap);
  100454:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100457:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045b:	8b 45 10             	mov    0x10(%ebp),%eax
  10045e:	89 04 24             	mov    %eax,(%esp)
  100461:	e8 bf fd ff ff       	call   100225 <vcprintf>
    cprintf("\n");
  100466:	c7 04 24 a6 33 10 00 	movl   $0x1033a6,(%esp)
  10046d:	e8 e6 fd ff ff       	call   100258 <cprintf>
    va_end(ap);
}
  100472:	90                   	nop
  100473:	c9                   	leave  
  100474:	c3                   	ret    

00100475 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100475:	55                   	push   %ebp
  100476:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100478:	a1 40 fe 10 00       	mov    0x10fe40,%eax
}
  10047d:	5d                   	pop    %ebp
  10047e:	c3                   	ret    

0010047f <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  10047f:	55                   	push   %ebp
  100480:	89 e5                	mov    %esp,%ebp
  100482:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100485:	8b 45 0c             	mov    0xc(%ebp),%eax
  100488:	8b 00                	mov    (%eax),%eax
  10048a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10048d:	8b 45 10             	mov    0x10(%ebp),%eax
  100490:	8b 00                	mov    (%eax),%eax
  100492:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100495:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  10049c:	e9 ca 00 00 00       	jmp    10056b <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1004a1:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004a7:	01 d0                	add    %edx,%eax
  1004a9:	89 c2                	mov    %eax,%edx
  1004ab:	c1 ea 1f             	shr    $0x1f,%edx
  1004ae:	01 d0                	add    %edx,%eax
  1004b0:	d1 f8                	sar    %eax
  1004b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004b8:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004bb:	eb 03                	jmp    1004c0 <stab_binsearch+0x41>
            m --;
  1004bd:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  1004c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004c3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004c6:	7c 1f                	jl     1004e7 <stab_binsearch+0x68>
  1004c8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004cb:	89 d0                	mov    %edx,%eax
  1004cd:	01 c0                	add    %eax,%eax
  1004cf:	01 d0                	add    %edx,%eax
  1004d1:	c1 e0 02             	shl    $0x2,%eax
  1004d4:	89 c2                	mov    %eax,%edx
  1004d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1004d9:	01 d0                	add    %edx,%eax
  1004db:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004df:	0f b6 c0             	movzbl %al,%eax
  1004e2:	39 45 14             	cmp    %eax,0x14(%ebp)
  1004e5:	75 d6                	jne    1004bd <stab_binsearch+0x3e>
        }
        if (m < l) {    // no match in [l, m]
  1004e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004ea:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004ed:	7d 09                	jge    1004f8 <stab_binsearch+0x79>
            l = true_m + 1;
  1004ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004f2:	40                   	inc    %eax
  1004f3:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  1004f6:	eb 73                	jmp    10056b <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  1004f8:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  1004ff:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100502:	89 d0                	mov    %edx,%eax
  100504:	01 c0                	add    %eax,%eax
  100506:	01 d0                	add    %edx,%eax
  100508:	c1 e0 02             	shl    $0x2,%eax
  10050b:	89 c2                	mov    %eax,%edx
  10050d:	8b 45 08             	mov    0x8(%ebp),%eax
  100510:	01 d0                	add    %edx,%eax
  100512:	8b 40 08             	mov    0x8(%eax),%eax
  100515:	39 45 18             	cmp    %eax,0x18(%ebp)
  100518:	76 11                	jbe    10052b <stab_binsearch+0xac>
            *region_left = m;
  10051a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100520:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100522:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100525:	40                   	inc    %eax
  100526:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100529:	eb 40                	jmp    10056b <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10052b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10052e:	89 d0                	mov    %edx,%eax
  100530:	01 c0                	add    %eax,%eax
  100532:	01 d0                	add    %edx,%eax
  100534:	c1 e0 02             	shl    $0x2,%eax
  100537:	89 c2                	mov    %eax,%edx
  100539:	8b 45 08             	mov    0x8(%ebp),%eax
  10053c:	01 d0                	add    %edx,%eax
  10053e:	8b 40 08             	mov    0x8(%eax),%eax
  100541:	39 45 18             	cmp    %eax,0x18(%ebp)
  100544:	73 14                	jae    10055a <stab_binsearch+0xdb>
            *region_right = m - 1;
  100546:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100549:	8d 50 ff             	lea    -0x1(%eax),%edx
  10054c:	8b 45 10             	mov    0x10(%ebp),%eax
  10054f:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100551:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100554:	48                   	dec    %eax
  100555:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100558:	eb 11                	jmp    10056b <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10055a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10055d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100560:	89 10                	mov    %edx,(%eax)
            l = m;
  100562:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100565:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  100568:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  10056b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10056e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100571:	0f 8e 2a ff ff ff    	jle    1004a1 <stab_binsearch+0x22>
        }
    }

    if (!any_matches) {
  100577:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10057b:	75 0f                	jne    10058c <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  10057d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100580:	8b 00                	mov    (%eax),%eax
  100582:	8d 50 ff             	lea    -0x1(%eax),%edx
  100585:	8b 45 10             	mov    0x10(%ebp),%eax
  100588:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10058a:	eb 3e                	jmp    1005ca <stab_binsearch+0x14b>
        l = *region_right;
  10058c:	8b 45 10             	mov    0x10(%ebp),%eax
  10058f:	8b 00                	mov    (%eax),%eax
  100591:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  100594:	eb 03                	jmp    100599 <stab_binsearch+0x11a>
  100596:	ff 4d fc             	decl   -0x4(%ebp)
  100599:	8b 45 0c             	mov    0xc(%ebp),%eax
  10059c:	8b 00                	mov    (%eax),%eax
  10059e:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1005a1:	7e 1f                	jle    1005c2 <stab_binsearch+0x143>
  1005a3:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005a6:	89 d0                	mov    %edx,%eax
  1005a8:	01 c0                	add    %eax,%eax
  1005aa:	01 d0                	add    %edx,%eax
  1005ac:	c1 e0 02             	shl    $0x2,%eax
  1005af:	89 c2                	mov    %eax,%edx
  1005b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1005b4:	01 d0                	add    %edx,%eax
  1005b6:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005ba:	0f b6 c0             	movzbl %al,%eax
  1005bd:	39 45 14             	cmp    %eax,0x14(%ebp)
  1005c0:	75 d4                	jne    100596 <stab_binsearch+0x117>
        *region_left = l;
  1005c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005c8:	89 10                	mov    %edx,(%eax)
}
  1005ca:	90                   	nop
  1005cb:	c9                   	leave  
  1005cc:	c3                   	ret    

001005cd <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005cd:	55                   	push   %ebp
  1005ce:	89 e5                	mov    %esp,%ebp
  1005d0:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d6:	c7 00 d8 33 10 00    	movl   $0x1033d8,(%eax)
    info->eip_line = 0;
  1005dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005df:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e9:	c7 40 08 d8 33 10 00 	movl   $0x1033d8,0x8(%eax)
    info->eip_fn_namelen = 9;
  1005f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f3:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  1005fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fd:	8b 55 08             	mov    0x8(%ebp),%edx
  100600:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100603:	8b 45 0c             	mov    0xc(%ebp),%eax
  100606:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  10060d:	c7 45 f4 ec 3b 10 00 	movl   $0x103bec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100614:	c7 45 f0 e4 c7 10 00 	movl   $0x10c7e4,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10061b:	c7 45 ec e5 c7 10 00 	movl   $0x10c7e5,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100622:	c7 45 e8 d0 e8 10 00 	movl   $0x10e8d0,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100629:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10062c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10062f:	76 0b                	jbe    10063c <debuginfo_eip+0x6f>
  100631:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100634:	48                   	dec    %eax
  100635:	0f b6 00             	movzbl (%eax),%eax
  100638:	84 c0                	test   %al,%al
  10063a:	74 0a                	je     100646 <debuginfo_eip+0x79>
        return -1;
  10063c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100641:	e9 ab 02 00 00       	jmp    1008f1 <debuginfo_eip+0x324>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100646:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10064d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100650:	2b 45 f4             	sub    -0xc(%ebp),%eax
  100653:	c1 f8 02             	sar    $0x2,%eax
  100656:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10065c:	48                   	dec    %eax
  10065d:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100660:	8b 45 08             	mov    0x8(%ebp),%eax
  100663:	89 44 24 10          	mov    %eax,0x10(%esp)
  100667:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  10066e:	00 
  10066f:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100672:	89 44 24 08          	mov    %eax,0x8(%esp)
  100676:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100679:	89 44 24 04          	mov    %eax,0x4(%esp)
  10067d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100680:	89 04 24             	mov    %eax,(%esp)
  100683:	e8 f7 fd ff ff       	call   10047f <stab_binsearch>
    if (lfile == 0)
  100688:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10068b:	85 c0                	test   %eax,%eax
  10068d:	75 0a                	jne    100699 <debuginfo_eip+0xcc>
        return -1;
  10068f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100694:	e9 58 02 00 00       	jmp    1008f1 <debuginfo_eip+0x324>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  100699:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10069c:	89 45 dc             	mov    %eax,-0x24(%ebp)
  10069f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a2:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1006a8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006ac:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006b3:	00 
  1006b4:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006b7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006bb:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006c5:	89 04 24             	mov    %eax,(%esp)
  1006c8:	e8 b2 fd ff ff       	call   10047f <stab_binsearch>

    if (lfun <= rfun) {
  1006cd:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006d0:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006d3:	39 c2                	cmp    %eax,%edx
  1006d5:	7f 78                	jg     10074f <debuginfo_eip+0x182>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006d7:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006da:	89 c2                	mov    %eax,%edx
  1006dc:	89 d0                	mov    %edx,%eax
  1006de:	01 c0                	add    %eax,%eax
  1006e0:	01 d0                	add    %edx,%eax
  1006e2:	c1 e0 02             	shl    $0x2,%eax
  1006e5:	89 c2                	mov    %eax,%edx
  1006e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006ea:	01 d0                	add    %edx,%eax
  1006ec:	8b 10                	mov    (%eax),%edx
  1006ee:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1006f1:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1006f4:	39 c2                	cmp    %eax,%edx
  1006f6:	73 22                	jae    10071a <debuginfo_eip+0x14d>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  1006f8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006fb:	89 c2                	mov    %eax,%edx
  1006fd:	89 d0                	mov    %edx,%eax
  1006ff:	01 c0                	add    %eax,%eax
  100701:	01 d0                	add    %edx,%eax
  100703:	c1 e0 02             	shl    $0x2,%eax
  100706:	89 c2                	mov    %eax,%edx
  100708:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10070b:	01 d0                	add    %edx,%eax
  10070d:	8b 10                	mov    (%eax),%edx
  10070f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100712:	01 c2                	add    %eax,%edx
  100714:	8b 45 0c             	mov    0xc(%ebp),%eax
  100717:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10071a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10071d:	89 c2                	mov    %eax,%edx
  10071f:	89 d0                	mov    %edx,%eax
  100721:	01 c0                	add    %eax,%eax
  100723:	01 d0                	add    %edx,%eax
  100725:	c1 e0 02             	shl    $0x2,%eax
  100728:	89 c2                	mov    %eax,%edx
  10072a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10072d:	01 d0                	add    %edx,%eax
  10072f:	8b 50 08             	mov    0x8(%eax),%edx
  100732:	8b 45 0c             	mov    0xc(%ebp),%eax
  100735:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100738:	8b 45 0c             	mov    0xc(%ebp),%eax
  10073b:	8b 40 10             	mov    0x10(%eax),%eax
  10073e:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100741:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100744:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100747:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10074a:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10074d:	eb 15                	jmp    100764 <debuginfo_eip+0x197>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10074f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100752:	8b 55 08             	mov    0x8(%ebp),%edx
  100755:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100758:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10075b:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  10075e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100761:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  100764:	8b 45 0c             	mov    0xc(%ebp),%eax
  100767:	8b 40 08             	mov    0x8(%eax),%eax
  10076a:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  100771:	00 
  100772:	89 04 24             	mov    %eax,(%esp)
  100775:	e8 ed 21 00 00       	call   102967 <strfind>
  10077a:	8b 55 0c             	mov    0xc(%ebp),%edx
  10077d:	8b 52 08             	mov    0x8(%edx),%edx
  100780:	29 d0                	sub    %edx,%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	8b 45 0c             	mov    0xc(%ebp),%eax
  100787:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  10078a:	8b 45 08             	mov    0x8(%ebp),%eax
  10078d:	89 44 24 10          	mov    %eax,0x10(%esp)
  100791:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  100798:	00 
  100799:	8d 45 d0             	lea    -0x30(%ebp),%eax
  10079c:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007a0:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007a3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007aa:	89 04 24             	mov    %eax,(%esp)
  1007ad:	e8 cd fc ff ff       	call   10047f <stab_binsearch>
    if (lline <= rline) {
  1007b2:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007b5:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007b8:	39 c2                	cmp    %eax,%edx
  1007ba:	7f 23                	jg     1007df <debuginfo_eip+0x212>
        info->eip_line = stabs[rline].n_desc;
  1007bc:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007bf:	89 c2                	mov    %eax,%edx
  1007c1:	89 d0                	mov    %edx,%eax
  1007c3:	01 c0                	add    %eax,%eax
  1007c5:	01 d0                	add    %edx,%eax
  1007c7:	c1 e0 02             	shl    $0x2,%eax
  1007ca:	89 c2                	mov    %eax,%edx
  1007cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007cf:	01 d0                	add    %edx,%eax
  1007d1:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007d5:	89 c2                	mov    %eax,%edx
  1007d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007da:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007dd:	eb 11                	jmp    1007f0 <debuginfo_eip+0x223>
        return -1;
  1007df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007e4:	e9 08 01 00 00       	jmp    1008f1 <debuginfo_eip+0x324>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  1007e9:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007ec:	48                   	dec    %eax
  1007ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  1007f0:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007f6:	39 c2                	cmp    %eax,%edx
  1007f8:	7c 56                	jl     100850 <debuginfo_eip+0x283>
           && stabs[lline].n_type != N_SOL
  1007fa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007fd:	89 c2                	mov    %eax,%edx
  1007ff:	89 d0                	mov    %edx,%eax
  100801:	01 c0                	add    %eax,%eax
  100803:	01 d0                	add    %edx,%eax
  100805:	c1 e0 02             	shl    $0x2,%eax
  100808:	89 c2                	mov    %eax,%edx
  10080a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10080d:	01 d0                	add    %edx,%eax
  10080f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100813:	3c 84                	cmp    $0x84,%al
  100815:	74 39                	je     100850 <debuginfo_eip+0x283>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100817:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10081a:	89 c2                	mov    %eax,%edx
  10081c:	89 d0                	mov    %edx,%eax
  10081e:	01 c0                	add    %eax,%eax
  100820:	01 d0                	add    %edx,%eax
  100822:	c1 e0 02             	shl    $0x2,%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10082a:	01 d0                	add    %edx,%eax
  10082c:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100830:	3c 64                	cmp    $0x64,%al
  100832:	75 b5                	jne    1007e9 <debuginfo_eip+0x21c>
  100834:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100837:	89 c2                	mov    %eax,%edx
  100839:	89 d0                	mov    %edx,%eax
  10083b:	01 c0                	add    %eax,%eax
  10083d:	01 d0                	add    %edx,%eax
  10083f:	c1 e0 02             	shl    $0x2,%eax
  100842:	89 c2                	mov    %eax,%edx
  100844:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100847:	01 d0                	add    %edx,%eax
  100849:	8b 40 08             	mov    0x8(%eax),%eax
  10084c:	85 c0                	test   %eax,%eax
  10084e:	74 99                	je     1007e9 <debuginfo_eip+0x21c>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  100850:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100853:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100856:	39 c2                	cmp    %eax,%edx
  100858:	7c 42                	jl     10089c <debuginfo_eip+0x2cf>
  10085a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10085d:	89 c2                	mov    %eax,%edx
  10085f:	89 d0                	mov    %edx,%eax
  100861:	01 c0                	add    %eax,%eax
  100863:	01 d0                	add    %edx,%eax
  100865:	c1 e0 02             	shl    $0x2,%eax
  100868:	89 c2                	mov    %eax,%edx
  10086a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10086d:	01 d0                	add    %edx,%eax
  10086f:	8b 10                	mov    (%eax),%edx
  100871:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100874:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100877:	39 c2                	cmp    %eax,%edx
  100879:	73 21                	jae    10089c <debuginfo_eip+0x2cf>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10087b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10087e:	89 c2                	mov    %eax,%edx
  100880:	89 d0                	mov    %edx,%eax
  100882:	01 c0                	add    %eax,%eax
  100884:	01 d0                	add    %edx,%eax
  100886:	c1 e0 02             	shl    $0x2,%eax
  100889:	89 c2                	mov    %eax,%edx
  10088b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10088e:	01 d0                	add    %edx,%eax
  100890:	8b 10                	mov    (%eax),%edx
  100892:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100895:	01 c2                	add    %eax,%edx
  100897:	8b 45 0c             	mov    0xc(%ebp),%eax
  10089a:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  10089c:	8b 55 dc             	mov    -0x24(%ebp),%edx
  10089f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008a2:	39 c2                	cmp    %eax,%edx
  1008a4:	7d 46                	jge    1008ec <debuginfo_eip+0x31f>
        for (lline = lfun + 1;
  1008a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008a9:	40                   	inc    %eax
  1008aa:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008ad:	eb 16                	jmp    1008c5 <debuginfo_eip+0x2f8>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008af:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b2:	8b 40 14             	mov    0x14(%eax),%eax
  1008b5:	8d 50 01             	lea    0x1(%eax),%edx
  1008b8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008bb:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  1008be:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008c1:	40                   	inc    %eax
  1008c2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008c5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008c8:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  1008cb:	39 c2                	cmp    %eax,%edx
  1008cd:	7d 1d                	jge    1008ec <debuginfo_eip+0x31f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008cf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008d2:	89 c2                	mov    %eax,%edx
  1008d4:	89 d0                	mov    %edx,%eax
  1008d6:	01 c0                	add    %eax,%eax
  1008d8:	01 d0                	add    %edx,%eax
  1008da:	c1 e0 02             	shl    $0x2,%eax
  1008dd:	89 c2                	mov    %eax,%edx
  1008df:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008e2:	01 d0                	add    %edx,%eax
  1008e4:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1008e8:	3c a0                	cmp    $0xa0,%al
  1008ea:	74 c3                	je     1008af <debuginfo_eip+0x2e2>
        }
    }
    return 0;
  1008ec:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1008f1:	c9                   	leave  
  1008f2:	c3                   	ret    

001008f3 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  1008f3:	55                   	push   %ebp
  1008f4:	89 e5                	mov    %esp,%ebp
  1008f6:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  1008f9:	c7 04 24 e2 33 10 00 	movl   $0x1033e2,(%esp)
  100900:	e8 53 f9 ff ff       	call   100258 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100905:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10090c:	00 
  10090d:	c7 04 24 fb 33 10 00 	movl   $0x1033fb,(%esp)
  100914:	e8 3f f9 ff ff       	call   100258 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100919:	c7 44 24 04 de 32 10 	movl   $0x1032de,0x4(%esp)
  100920:	00 
  100921:	c7 04 24 13 34 10 00 	movl   $0x103413,(%esp)
  100928:	e8 2b f9 ff ff       	call   100258 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10092d:	c7 44 24 04 16 fa 10 	movl   $0x10fa16,0x4(%esp)
  100934:	00 
  100935:	c7 04 24 2b 34 10 00 	movl   $0x10342b,(%esp)
  10093c:	e8 17 f9 ff ff       	call   100258 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100941:	c7 44 24 04 20 0d 11 	movl   $0x110d20,0x4(%esp)
  100948:	00 
  100949:	c7 04 24 43 34 10 00 	movl   $0x103443,(%esp)
  100950:	e8 03 f9 ff ff       	call   100258 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100955:	b8 20 0d 11 00       	mov    $0x110d20,%eax
  10095a:	2d 00 00 10 00       	sub    $0x100000,%eax
  10095f:	05 ff 03 00 00       	add    $0x3ff,%eax
  100964:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10096a:	85 c0                	test   %eax,%eax
  10096c:	0f 48 c2             	cmovs  %edx,%eax
  10096f:	c1 f8 0a             	sar    $0xa,%eax
  100972:	89 44 24 04          	mov    %eax,0x4(%esp)
  100976:	c7 04 24 5c 34 10 00 	movl   $0x10345c,(%esp)
  10097d:	e8 d6 f8 ff ff       	call   100258 <cprintf>
}
  100982:	90                   	nop
  100983:	c9                   	leave  
  100984:	c3                   	ret    

00100985 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  100985:	55                   	push   %ebp
  100986:	89 e5                	mov    %esp,%ebp
  100988:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  10098e:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100991:	89 44 24 04          	mov    %eax,0x4(%esp)
  100995:	8b 45 08             	mov    0x8(%ebp),%eax
  100998:	89 04 24             	mov    %eax,(%esp)
  10099b:	e8 2d fc ff ff       	call   1005cd <debuginfo_eip>
  1009a0:	85 c0                	test   %eax,%eax
  1009a2:	74 15                	je     1009b9 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1009a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009ab:	c7 04 24 86 34 10 00 	movl   $0x103486,(%esp)
  1009b2:	e8 a1 f8 ff ff       	call   100258 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009b7:	eb 6c                	jmp    100a25 <print_debuginfo+0xa0>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009c0:	eb 1b                	jmp    1009dd <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1009c2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009c8:	01 d0                	add    %edx,%eax
  1009ca:	0f b6 10             	movzbl (%eax),%edx
  1009cd:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009d6:	01 c8                	add    %ecx,%eax
  1009d8:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009da:	ff 45 f4             	incl   -0xc(%ebp)
  1009dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009e0:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  1009e3:	7c dd                	jl     1009c2 <print_debuginfo+0x3d>
        fnname[j] = '\0';
  1009e5:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  1009eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ee:	01 d0                	add    %edx,%eax
  1009f0:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  1009f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  1009f6:	8b 55 08             	mov    0x8(%ebp),%edx
  1009f9:	89 d1                	mov    %edx,%ecx
  1009fb:	29 c1                	sub    %eax,%ecx
  1009fd:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a00:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a03:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a07:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a0d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a11:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a15:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a19:	c7 04 24 a2 34 10 00 	movl   $0x1034a2,(%esp)
  100a20:	e8 33 f8 ff ff       	call   100258 <cprintf>
}
  100a25:	90                   	nop
  100a26:	c9                   	leave  
  100a27:	c3                   	ret    

00100a28 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a28:	55                   	push   %ebp
  100a29:	89 e5                	mov    %esp,%ebp
  100a2b:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a2e:	8b 45 04             	mov    0x4(%ebp),%eax
  100a31:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a34:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a37:	c9                   	leave  
  100a38:	c3                   	ret    

00100a39 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a39:	55                   	push   %ebp
  100a3a:	89 e5                	mov    %esp,%ebp
  100a3c:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a3f:	89 e8                	mov    %ebp,%eax
  100a41:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a44:	8b 45 e0             	mov    -0x20(%ebp),%eax
        定义变量eip的值存储寄存器eip的值
          注意read_eip是不是内联函数，而是普通非内联函数，和刚才的read_ebp刚好相反
          这样做，当执行时调用read_eip函数时,会把调用指令的下一条指令地址(既是eip寄存器的值也是当前函数调用返回地址)压入栈中
          这样就可以通过栈内获取到eip的值
     */
            uint32_t *ebp =  (uint32_t *)read_ebp();
  100a47:	89 45 f4             	mov    %eax,-0xc(%ebp)
            uint32_t eip =  read_eip();//当前栈的栈顶
  100a4a:	e8 d9 ff ff ff       	call   100a28 <read_eip>
  100a4f:	89 45 f0             	mov    %eax,-0x10(%ebp)
                /*
                    ebp存的值是上一栈帧的ebp，所以递归下直到ebp为0 
                    且栈的深度不超过STACKFRAME_DEPTH 并且 ebp 
            */
            for(int i=0;ebp !=0 && i<STACKFRAME_DEPTH;i++) {
  100a52:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a59:	e9 9a 00 00 00       	jmp    100af8 <print_stackframe+0xbf>
                cprintf("ebp:%08x  ",(uint32_t)ebp);
  100a5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a61:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a65:	c7 04 24 b4 34 10 00 	movl   $0x1034b4,(%esp)
  100a6c:	e8 e7 f7 ff ff       	call   100258 <cprintf>
                cprintf("eip:%08x  ",eip);
  100a71:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a74:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a78:	c7 04 24 bf 34 10 00 	movl   $0x1034bf,(%esp)
  100a7f:	e8 d4 f7 ff ff       	call   100258 <cprintf>
                /*强制类型转换，把ebp的值作为地址，同类型加2，往上偏移两个单位
                  args 即是指针
                */
                uint32_t* args = (uint32_t*)ebp + 2;
  100a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a87:	83 c0 08             	add    $0x8,%eax
  100a8a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                cprintf("args: ");
  100a8d:	c7 04 24 ca 34 10 00 	movl   $0x1034ca,(%esp)
  100a94:	e8 bf f7 ff ff       	call   100258 <cprintf>
                for(int j=0;j < 4;j++) {
  100a99:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100aa0:	eb 24                	jmp    100ac6 <print_stackframe+0x8d>
                     cprintf("%08x  ",args[j]);
  100aa2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100aa5:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100aac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100aaf:	01 d0                	add    %edx,%eax
  100ab1:	8b 00                	mov    (%eax),%eax
  100ab3:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ab7:	c7 04 24 d1 34 10 00 	movl   $0x1034d1,(%esp)
  100abe:	e8 95 f7 ff ff       	call   100258 <cprintf>
                for(int j=0;j < 4;j++) {
  100ac3:	ff 45 e8             	incl   -0x18(%ebp)
  100ac6:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100aca:	7e d6                	jle    100aa2 <print_stackframe+0x69>
                }
                cprintf("\n ");
  100acc:	c7 04 24 d8 34 10 00 	movl   $0x1034d8,(%esp)
  100ad3:	e8 80 f7 ff ff       	call   100258 <cprintf>
                print_debuginfo(eip-1);
  100ad8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100adb:	48                   	dec    %eax
  100adc:	89 04 24             	mov    %eax,(%esp)
  100adf:	e8 a1 fe ff ff       	call   100985 <print_debuginfo>
                eip = (uint32_t)(ebp + 1);
  100ae4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ae7:	83 c0 04             	add    $0x4,%eax
  100aea:	89 45 f0             	mov    %eax,-0x10(%ebp)
                ebp = (uint32_t *)*ebp;//ebp里存的值是上一个ebp的值
  100aed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af0:	8b 00                	mov    (%eax),%eax
  100af2:	89 45 f4             	mov    %eax,-0xc(%ebp)
            for(int i=0;ebp !=0 && i<STACKFRAME_DEPTH;i++) {
  100af5:	ff 45 ec             	incl   -0x14(%ebp)
  100af8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100afc:	74 0a                	je     100b08 <print_stackframe+0xcf>
  100afe:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b02:	0f 8e 56 ff ff ff    	jle    100a5e <print_stackframe+0x25>


            }
}
  100b08:	90                   	nop
  100b09:	c9                   	leave  
  100b0a:	c3                   	ret    

00100b0b <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b0b:	55                   	push   %ebp
  100b0c:	89 e5                	mov    %esp,%ebp
  100b0e:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b11:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b18:	eb 0c                	jmp    100b26 <parse+0x1b>
            *buf ++ = '\0';
  100b1a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b1d:	8d 50 01             	lea    0x1(%eax),%edx
  100b20:	89 55 08             	mov    %edx,0x8(%ebp)
  100b23:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b26:	8b 45 08             	mov    0x8(%ebp),%eax
  100b29:	0f b6 00             	movzbl (%eax),%eax
  100b2c:	84 c0                	test   %al,%al
  100b2e:	74 1d                	je     100b4d <parse+0x42>
  100b30:	8b 45 08             	mov    0x8(%ebp),%eax
  100b33:	0f b6 00             	movzbl (%eax),%eax
  100b36:	0f be c0             	movsbl %al,%eax
  100b39:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b3d:	c7 04 24 5c 35 10 00 	movl   $0x10355c,(%esp)
  100b44:	e8 ec 1d 00 00       	call   102935 <strchr>
  100b49:	85 c0                	test   %eax,%eax
  100b4b:	75 cd                	jne    100b1a <parse+0xf>
        }
        if (*buf == '\0') {
  100b4d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b50:	0f b6 00             	movzbl (%eax),%eax
  100b53:	84 c0                	test   %al,%al
  100b55:	74 65                	je     100bbc <parse+0xb1>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b57:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b5b:	75 14                	jne    100b71 <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b5d:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b64:	00 
  100b65:	c7 04 24 61 35 10 00 	movl   $0x103561,(%esp)
  100b6c:	e8 e7 f6 ff ff       	call   100258 <cprintf>
        }
        argv[argc ++] = buf;
  100b71:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b74:	8d 50 01             	lea    0x1(%eax),%edx
  100b77:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100b7a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100b81:	8b 45 0c             	mov    0xc(%ebp),%eax
  100b84:	01 c2                	add    %eax,%edx
  100b86:	8b 45 08             	mov    0x8(%ebp),%eax
  100b89:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b8b:	eb 03                	jmp    100b90 <parse+0x85>
            buf ++;
  100b8d:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100b90:	8b 45 08             	mov    0x8(%ebp),%eax
  100b93:	0f b6 00             	movzbl (%eax),%eax
  100b96:	84 c0                	test   %al,%al
  100b98:	74 8c                	je     100b26 <parse+0x1b>
  100b9a:	8b 45 08             	mov    0x8(%ebp),%eax
  100b9d:	0f b6 00             	movzbl (%eax),%eax
  100ba0:	0f be c0             	movsbl %al,%eax
  100ba3:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba7:	c7 04 24 5c 35 10 00 	movl   $0x10355c,(%esp)
  100bae:	e8 82 1d 00 00       	call   102935 <strchr>
  100bb3:	85 c0                	test   %eax,%eax
  100bb5:	74 d6                	je     100b8d <parse+0x82>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100bb7:	e9 6a ff ff ff       	jmp    100b26 <parse+0x1b>
            break;
  100bbc:	90                   	nop
        }
    }
    return argc;
  100bbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bc0:	c9                   	leave  
  100bc1:	c3                   	ret    

00100bc2 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bc2:	55                   	push   %ebp
  100bc3:	89 e5                	mov    %esp,%ebp
  100bc5:	53                   	push   %ebx
  100bc6:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bc9:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bcc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bd0:	8b 45 08             	mov    0x8(%ebp),%eax
  100bd3:	89 04 24             	mov    %eax,(%esp)
  100bd6:	e8 30 ff ff ff       	call   100b0b <parse>
  100bdb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100bde:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100be2:	75 0a                	jne    100bee <runcmd+0x2c>
        return 0;
  100be4:	b8 00 00 00 00       	mov    $0x0,%eax
  100be9:	e9 83 00 00 00       	jmp    100c71 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100bee:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100bf5:	eb 5a                	jmp    100c51 <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100bf7:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100bfa:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100bfd:	89 d0                	mov    %edx,%eax
  100bff:	01 c0                	add    %eax,%eax
  100c01:	01 d0                	add    %edx,%eax
  100c03:	c1 e0 02             	shl    $0x2,%eax
  100c06:	05 00 f0 10 00       	add    $0x10f000,%eax
  100c0b:	8b 00                	mov    (%eax),%eax
  100c0d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c11:	89 04 24             	mov    %eax,(%esp)
  100c14:	e8 80 1c 00 00       	call   102899 <strcmp>
  100c19:	85 c0                	test   %eax,%eax
  100c1b:	75 31                	jne    100c4e <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c1d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c20:	89 d0                	mov    %edx,%eax
  100c22:	01 c0                	add    %eax,%eax
  100c24:	01 d0                	add    %edx,%eax
  100c26:	c1 e0 02             	shl    $0x2,%eax
  100c29:	05 08 f0 10 00       	add    $0x10f008,%eax
  100c2e:	8b 10                	mov    (%eax),%edx
  100c30:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c33:	83 c0 04             	add    $0x4,%eax
  100c36:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c39:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c3c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c3f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c43:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c47:	89 1c 24             	mov    %ebx,(%esp)
  100c4a:	ff d2                	call   *%edx
  100c4c:	eb 23                	jmp    100c71 <runcmd+0xaf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100c4e:	ff 45 f4             	incl   -0xc(%ebp)
  100c51:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c54:	83 f8 02             	cmp    $0x2,%eax
  100c57:	76 9e                	jbe    100bf7 <runcmd+0x35>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c59:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c5c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c60:	c7 04 24 7f 35 10 00 	movl   $0x10357f,(%esp)
  100c67:	e8 ec f5 ff ff       	call   100258 <cprintf>
    return 0;
  100c6c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c71:	83 c4 64             	add    $0x64,%esp
  100c74:	5b                   	pop    %ebx
  100c75:	5d                   	pop    %ebp
  100c76:	c3                   	ret    

00100c77 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100c77:	55                   	push   %ebp
  100c78:	89 e5                	mov    %esp,%ebp
  100c7a:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100c7d:	c7 04 24 98 35 10 00 	movl   $0x103598,(%esp)
  100c84:	e8 cf f5 ff ff       	call   100258 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100c89:	c7 04 24 c0 35 10 00 	movl   $0x1035c0,(%esp)
  100c90:	e8 c3 f5 ff ff       	call   100258 <cprintf>

    if (tf != NULL) {
  100c95:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100c99:	74 0b                	je     100ca6 <kmonitor+0x2f>
        print_trapframe(tf);
  100c9b:	8b 45 08             	mov    0x8(%ebp),%eax
  100c9e:	89 04 24             	mov    %eax,(%esp)
  100ca1:	e8 f1 0b 00 00       	call   101897 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100ca6:	c7 04 24 e5 35 10 00 	movl   $0x1035e5,(%esp)
  100cad:	e8 49 f6 ff ff       	call   1002fb <readline>
  100cb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cb5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cb9:	74 eb                	je     100ca6 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100cbb:	8b 45 08             	mov    0x8(%ebp),%eax
  100cbe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc5:	89 04 24             	mov    %eax,(%esp)
  100cc8:	e8 f5 fe ff ff       	call   100bc2 <runcmd>
  100ccd:	85 c0                	test   %eax,%eax
  100ccf:	78 02                	js     100cd3 <kmonitor+0x5c>
        if ((buf = readline("K> ")) != NULL) {
  100cd1:	eb d3                	jmp    100ca6 <kmonitor+0x2f>
                break;
  100cd3:	90                   	nop
            }
        }
    }
}
  100cd4:	90                   	nop
  100cd5:	c9                   	leave  
  100cd6:	c3                   	ret    

00100cd7 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100cd7:	55                   	push   %ebp
  100cd8:	89 e5                	mov    %esp,%ebp
  100cda:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100cdd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100ce4:	eb 3d                	jmp    100d23 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100ce6:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ce9:	89 d0                	mov    %edx,%eax
  100ceb:	01 c0                	add    %eax,%eax
  100ced:	01 d0                	add    %edx,%eax
  100cef:	c1 e0 02             	shl    $0x2,%eax
  100cf2:	05 04 f0 10 00       	add    $0x10f004,%eax
  100cf7:	8b 08                	mov    (%eax),%ecx
  100cf9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100cfc:	89 d0                	mov    %edx,%eax
  100cfe:	01 c0                	add    %eax,%eax
  100d00:	01 d0                	add    %edx,%eax
  100d02:	c1 e0 02             	shl    $0x2,%eax
  100d05:	05 00 f0 10 00       	add    $0x10f000,%eax
  100d0a:	8b 00                	mov    (%eax),%eax
  100d0c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d10:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d14:	c7 04 24 e9 35 10 00 	movl   $0x1035e9,(%esp)
  100d1b:	e8 38 f5 ff ff       	call   100258 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d20:	ff 45 f4             	incl   -0xc(%ebp)
  100d23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d26:	83 f8 02             	cmp    $0x2,%eax
  100d29:	76 bb                	jbe    100ce6 <mon_help+0xf>
    }
    return 0;
  100d2b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d30:	c9                   	leave  
  100d31:	c3                   	ret    

00100d32 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d32:	55                   	push   %ebp
  100d33:	89 e5                	mov    %esp,%ebp
  100d35:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d38:	e8 b6 fb ff ff       	call   1008f3 <print_kerninfo>
    return 0;
  100d3d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d42:	c9                   	leave  
  100d43:	c3                   	ret    

00100d44 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d44:	55                   	push   %ebp
  100d45:	89 e5                	mov    %esp,%ebp
  100d47:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d4a:	e8 ea fc ff ff       	call   100a39 <print_stackframe>
    return 0;
  100d4f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d54:	c9                   	leave  
  100d55:	c3                   	ret    

00100d56 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d56:	55                   	push   %ebp
  100d57:	89 e5                	mov    %esp,%ebp
  100d59:	83 ec 28             	sub    $0x28,%esp
  100d5c:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100d62:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d66:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d6a:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d6e:	ee                   	out    %al,(%dx)
}
  100d6f:	90                   	nop
  100d70:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d76:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d7a:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d7e:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d82:	ee                   	out    %al,(%dx)
}
  100d83:	90                   	nop
  100d84:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100d8a:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d8e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d92:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d96:	ee                   	out    %al,(%dx)
}
  100d97:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d98:	c7 05 08 09 11 00 00 	movl   $0x0,0x110908
  100d9f:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100da2:	c7 04 24 f2 35 10 00 	movl   $0x1035f2,(%esp)
  100da9:	e8 aa f4 ff ff       	call   100258 <cprintf>
    pic_enable(IRQ_TIMER);
  100dae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100db5:	e8 e9 08 00 00       	call   1016a3 <pic_enable>
}
  100dba:	90                   	nop
  100dbb:	c9                   	leave  
  100dbc:	c3                   	ret    

00100dbd <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100dbd:	55                   	push   %ebp
  100dbe:	89 e5                	mov    %esp,%ebp
  100dc0:	83 ec 10             	sub    $0x10,%esp
  100dc3:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc9:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100dcd:	89 c2                	mov    %eax,%edx
  100dcf:	ec                   	in     (%dx),%al
  100dd0:	88 45 f1             	mov    %al,-0xf(%ebp)
  100dd3:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100dd9:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100ddd:	89 c2                	mov    %eax,%edx
  100ddf:	ec                   	in     (%dx),%al
  100de0:	88 45 f5             	mov    %al,-0xb(%ebp)
  100de3:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100de9:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100ded:	89 c2                	mov    %eax,%edx
  100def:	ec                   	in     (%dx),%al
  100df0:	88 45 f9             	mov    %al,-0x7(%ebp)
  100df3:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100df9:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dfd:	89 c2                	mov    %eax,%edx
  100dff:	ec                   	in     (%dx),%al
  100e00:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e03:	90                   	nop
  100e04:	c9                   	leave  
  100e05:	c3                   	ret    

00100e06 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e06:	55                   	push   %ebp
  100e07:	89 e5                	mov    %esp,%ebp
  100e09:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e0c:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e13:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e16:	0f b7 00             	movzwl (%eax),%eax
  100e19:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e20:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e25:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e28:	0f b7 00             	movzwl (%eax),%eax
  100e2b:	0f b7 c0             	movzwl %ax,%eax
  100e2e:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e33:	74 12                	je     100e47 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e35:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e3c:	66 c7 05 66 fe 10 00 	movw   $0x3b4,0x10fe66
  100e43:	b4 03 
  100e45:	eb 13                	jmp    100e5a <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e47:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e4a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e4e:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e51:	66 c7 05 66 fe 10 00 	movw   $0x3d4,0x10fe66
  100e58:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e5a:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e61:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100e65:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e69:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100e6d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100e71:	ee                   	out    %al,(%dx)
}
  100e72:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e73:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100e7a:	40                   	inc    %eax
  100e7b:	0f b7 c0             	movzwl %ax,%eax
  100e7e:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e82:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100e86:	89 c2                	mov    %eax,%edx
  100e88:	ec                   	in     (%dx),%al
  100e89:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100e8c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100e90:	0f b6 c0             	movzbl %al,%eax
  100e93:	c1 e0 08             	shl    $0x8,%eax
  100e96:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e99:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100ea0:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100ea4:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ea8:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100eac:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100eb0:	ee                   	out    %al,(%dx)
}
  100eb1:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100eb2:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  100eb9:	40                   	inc    %eax
  100eba:	0f b7 c0             	movzwl %ax,%eax
  100ebd:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ec1:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100ec5:	89 c2                	mov    %eax,%edx
  100ec7:	ec                   	in     (%dx),%al
  100ec8:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100ecb:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100ecf:	0f b6 c0             	movzbl %al,%eax
  100ed2:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100ed5:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ed8:	a3 60 fe 10 00       	mov    %eax,0x10fe60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100edd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ee0:	0f b7 c0             	movzwl %ax,%eax
  100ee3:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
}
  100ee9:	90                   	nop
  100eea:	c9                   	leave  
  100eeb:	c3                   	ret    

00100eec <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100eec:	55                   	push   %ebp
  100eed:	89 e5                	mov    %esp,%ebp
  100eef:	83 ec 48             	sub    $0x48,%esp
  100ef2:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100ef8:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100efc:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f00:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f04:	ee                   	out    %al,(%dx)
}
  100f05:	90                   	nop
  100f06:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f0c:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f10:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f14:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f18:	ee                   	out    %al,(%dx)
}
  100f19:	90                   	nop
  100f1a:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100f20:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f24:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100f28:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100f2c:	ee                   	out    %al,(%dx)
}
  100f2d:	90                   	nop
  100f2e:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f34:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f38:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f3c:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f40:	ee                   	out    %al,(%dx)
}
  100f41:	90                   	nop
  100f42:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100f48:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f4c:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f50:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f54:	ee                   	out    %al,(%dx)
}
  100f55:	90                   	nop
  100f56:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100f5c:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f60:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f64:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f68:	ee                   	out    %al,(%dx)
}
  100f69:	90                   	nop
  100f6a:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f70:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f74:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f78:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f7c:	ee                   	out    %al,(%dx)
}
  100f7d:	90                   	nop
  100f7e:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f84:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100f88:	89 c2                	mov    %eax,%edx
  100f8a:	ec                   	in     (%dx),%al
  100f8b:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100f8e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f92:	3c ff                	cmp    $0xff,%al
  100f94:	0f 95 c0             	setne  %al
  100f97:	0f b6 c0             	movzbl %al,%eax
  100f9a:	a3 68 fe 10 00       	mov    %eax,0x10fe68
  100f9f:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fa5:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100fa9:	89 c2                	mov    %eax,%edx
  100fab:	ec                   	in     (%dx),%al
  100fac:	88 45 f1             	mov    %al,-0xf(%ebp)
  100faf:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  100fb5:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100fb9:	89 c2                	mov    %eax,%edx
  100fbb:	ec                   	in     (%dx),%al
  100fbc:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fbf:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  100fc4:	85 c0                	test   %eax,%eax
  100fc6:	74 0c                	je     100fd4 <serial_init+0xe8>
        pic_enable(IRQ_COM1);
  100fc8:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fcf:	e8 cf 06 00 00       	call   1016a3 <pic_enable>
    }
}
  100fd4:	90                   	nop
  100fd5:	c9                   	leave  
  100fd6:	c3                   	ret    

00100fd7 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fd7:	55                   	push   %ebp
  100fd8:	89 e5                	mov    %esp,%ebp
  100fda:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fdd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fe4:	eb 08                	jmp    100fee <lpt_putc_sub+0x17>
        delay();
  100fe6:	e8 d2 fd ff ff       	call   100dbd <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100feb:	ff 45 fc             	incl   -0x4(%ebp)
  100fee:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100ff4:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100ff8:	89 c2                	mov    %eax,%edx
  100ffa:	ec                   	in     (%dx),%al
  100ffb:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100ffe:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101002:	84 c0                	test   %al,%al
  101004:	78 09                	js     10100f <lpt_putc_sub+0x38>
  101006:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10100d:	7e d7                	jle    100fe6 <lpt_putc_sub+0xf>
    }
    outb(LPTPORT + 0, c);
  10100f:	8b 45 08             	mov    0x8(%ebp),%eax
  101012:	0f b6 c0             	movzbl %al,%eax
  101015:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  10101b:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10101e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101022:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101026:	ee                   	out    %al,(%dx)
}
  101027:	90                   	nop
  101028:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10102e:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101032:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101036:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10103a:	ee                   	out    %al,(%dx)
}
  10103b:	90                   	nop
  10103c:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101042:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101046:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10104a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10104e:	ee                   	out    %al,(%dx)
}
  10104f:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101050:	90                   	nop
  101051:	c9                   	leave  
  101052:	c3                   	ret    

00101053 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101053:	55                   	push   %ebp
  101054:	89 e5                	mov    %esp,%ebp
  101056:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101059:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  10105d:	74 0d                	je     10106c <lpt_putc+0x19>
        lpt_putc_sub(c);
  10105f:	8b 45 08             	mov    0x8(%ebp),%eax
  101062:	89 04 24             	mov    %eax,(%esp)
  101065:	e8 6d ff ff ff       	call   100fd7 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  10106a:	eb 24                	jmp    101090 <lpt_putc+0x3d>
        lpt_putc_sub('\b');
  10106c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101073:	e8 5f ff ff ff       	call   100fd7 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101078:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10107f:	e8 53 ff ff ff       	call   100fd7 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101084:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10108b:	e8 47 ff ff ff       	call   100fd7 <lpt_putc_sub>
}
  101090:	90                   	nop
  101091:	c9                   	leave  
  101092:	c3                   	ret    

00101093 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101093:	55                   	push   %ebp
  101094:	89 e5                	mov    %esp,%ebp
  101096:	53                   	push   %ebx
  101097:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10109a:	8b 45 08             	mov    0x8(%ebp),%eax
  10109d:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010a2:	85 c0                	test   %eax,%eax
  1010a4:	75 07                	jne    1010ad <cga_putc+0x1a>
        c |= 0x0700;
  1010a6:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b0:	0f b6 c0             	movzbl %al,%eax
  1010b3:	83 f8 0d             	cmp    $0xd,%eax
  1010b6:	74 72                	je     10112a <cga_putc+0x97>
  1010b8:	83 f8 0d             	cmp    $0xd,%eax
  1010bb:	0f 8f a3 00 00 00    	jg     101164 <cga_putc+0xd1>
  1010c1:	83 f8 08             	cmp    $0x8,%eax
  1010c4:	74 0a                	je     1010d0 <cga_putc+0x3d>
  1010c6:	83 f8 0a             	cmp    $0xa,%eax
  1010c9:	74 4c                	je     101117 <cga_putc+0x84>
  1010cb:	e9 94 00 00 00       	jmp    101164 <cga_putc+0xd1>
    case '\b':
        if (crt_pos > 0) {
  1010d0:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010d7:	85 c0                	test   %eax,%eax
  1010d9:	0f 84 af 00 00 00    	je     10118e <cga_putc+0xfb>
            crt_pos --;
  1010df:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1010e6:	48                   	dec    %eax
  1010e7:	0f b7 c0             	movzwl %ax,%eax
  1010ea:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010f0:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f3:	98                   	cwtl   
  1010f4:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010f9:	98                   	cwtl   
  1010fa:	83 c8 20             	or     $0x20,%eax
  1010fd:	98                   	cwtl   
  1010fe:	8b 15 60 fe 10 00    	mov    0x10fe60,%edx
  101104:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  10110b:	01 c9                	add    %ecx,%ecx
  10110d:	01 ca                	add    %ecx,%edx
  10110f:	0f b7 c0             	movzwl %ax,%eax
  101112:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  101115:	eb 77                	jmp    10118e <cga_putc+0xfb>
    case '\n':
        crt_pos += CRT_COLS;
  101117:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10111e:	83 c0 50             	add    $0x50,%eax
  101121:	0f b7 c0             	movzwl %ax,%eax
  101124:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  10112a:	0f b7 1d 64 fe 10 00 	movzwl 0x10fe64,%ebx
  101131:	0f b7 0d 64 fe 10 00 	movzwl 0x10fe64,%ecx
  101138:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  10113d:	89 c8                	mov    %ecx,%eax
  10113f:	f7 e2                	mul    %edx
  101141:	c1 ea 06             	shr    $0x6,%edx
  101144:	89 d0                	mov    %edx,%eax
  101146:	c1 e0 02             	shl    $0x2,%eax
  101149:	01 d0                	add    %edx,%eax
  10114b:	c1 e0 04             	shl    $0x4,%eax
  10114e:	29 c1                	sub    %eax,%ecx
  101150:	89 c8                	mov    %ecx,%eax
  101152:	0f b7 c0             	movzwl %ax,%eax
  101155:	29 c3                	sub    %eax,%ebx
  101157:	89 d8                	mov    %ebx,%eax
  101159:	0f b7 c0             	movzwl %ax,%eax
  10115c:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
        break;
  101162:	eb 2b                	jmp    10118f <cga_putc+0xfc>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101164:	8b 0d 60 fe 10 00    	mov    0x10fe60,%ecx
  10116a:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101171:	8d 50 01             	lea    0x1(%eax),%edx
  101174:	0f b7 d2             	movzwl %dx,%edx
  101177:	66 89 15 64 fe 10 00 	mov    %dx,0x10fe64
  10117e:	01 c0                	add    %eax,%eax
  101180:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101183:	8b 45 08             	mov    0x8(%ebp),%eax
  101186:	0f b7 c0             	movzwl %ax,%eax
  101189:	66 89 02             	mov    %ax,(%edx)
        break;
  10118c:	eb 01                	jmp    10118f <cga_putc+0xfc>
        break;
  10118e:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10118f:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  101196:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10119b:	76 5d                	jbe    1011fa <cga_putc+0x167>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  10119d:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011a2:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011a8:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011ad:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011b4:	00 
  1011b5:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011b9:	89 04 24             	mov    %eax,(%esp)
  1011bc:	e8 69 19 00 00       	call   102b2a <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011c1:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011c8:	eb 14                	jmp    1011de <cga_putc+0x14b>
            crt_buf[i] = 0x0700 | ' ';
  1011ca:	a1 60 fe 10 00       	mov    0x10fe60,%eax
  1011cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011d2:	01 d2                	add    %edx,%edx
  1011d4:	01 d0                	add    %edx,%eax
  1011d6:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011db:	ff 45 f4             	incl   -0xc(%ebp)
  1011de:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011e5:	7e e3                	jle    1011ca <cga_putc+0x137>
        }
        crt_pos -= CRT_COLS;
  1011e7:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  1011ee:	83 e8 50             	sub    $0x50,%eax
  1011f1:	0f b7 c0             	movzwl %ax,%eax
  1011f4:	66 a3 64 fe 10 00    	mov    %ax,0x10fe64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011fa:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101201:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101205:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101209:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10120d:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101211:	ee                   	out    %al,(%dx)
}
  101212:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  101213:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10121a:	c1 e8 08             	shr    $0x8,%eax
  10121d:	0f b7 c0             	movzwl %ax,%eax
  101220:	0f b6 c0             	movzbl %al,%eax
  101223:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  10122a:	42                   	inc    %edx
  10122b:	0f b7 d2             	movzwl %dx,%edx
  10122e:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  101232:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101235:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101239:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  10123d:	ee                   	out    %al,(%dx)
}
  10123e:	90                   	nop
    outb(addr_6845, 15);
  10123f:	0f b7 05 66 fe 10 00 	movzwl 0x10fe66,%eax
  101246:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  10124a:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10124e:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101252:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101256:	ee                   	out    %al,(%dx)
}
  101257:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  101258:	0f b7 05 64 fe 10 00 	movzwl 0x10fe64,%eax
  10125f:	0f b6 c0             	movzbl %al,%eax
  101262:	0f b7 15 66 fe 10 00 	movzwl 0x10fe66,%edx
  101269:	42                   	inc    %edx
  10126a:	0f b7 d2             	movzwl %dx,%edx
  10126d:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101271:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101274:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101278:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10127c:	ee                   	out    %al,(%dx)
}
  10127d:	90                   	nop
}
  10127e:	90                   	nop
  10127f:	83 c4 34             	add    $0x34,%esp
  101282:	5b                   	pop    %ebx
  101283:	5d                   	pop    %ebp
  101284:	c3                   	ret    

00101285 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101285:	55                   	push   %ebp
  101286:	89 e5                	mov    %esp,%ebp
  101288:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10128b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101292:	eb 08                	jmp    10129c <serial_putc_sub+0x17>
        delay();
  101294:	e8 24 fb ff ff       	call   100dbd <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101299:	ff 45 fc             	incl   -0x4(%ebp)
  10129c:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012a2:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1012a6:	89 c2                	mov    %eax,%edx
  1012a8:	ec                   	in     (%dx),%al
  1012a9:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  1012ac:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1012b0:	0f b6 c0             	movzbl %al,%eax
  1012b3:	83 e0 20             	and    $0x20,%eax
  1012b6:	85 c0                	test   %eax,%eax
  1012b8:	75 09                	jne    1012c3 <serial_putc_sub+0x3e>
  1012ba:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012c1:	7e d1                	jle    101294 <serial_putc_sub+0xf>
    }
    outb(COM1 + COM_TX, c);
  1012c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c6:	0f b6 c0             	movzbl %al,%eax
  1012c9:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  1012cf:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012d2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012d6:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012da:	ee                   	out    %al,(%dx)
}
  1012db:	90                   	nop
}
  1012dc:	90                   	nop
  1012dd:	c9                   	leave  
  1012de:	c3                   	ret    

001012df <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012df:	55                   	push   %ebp
  1012e0:	89 e5                	mov    %esp,%ebp
  1012e2:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012e5:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012e9:	74 0d                	je     1012f8 <serial_putc+0x19>
        serial_putc_sub(c);
  1012eb:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ee:	89 04 24             	mov    %eax,(%esp)
  1012f1:	e8 8f ff ff ff       	call   101285 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012f6:	eb 24                	jmp    10131c <serial_putc+0x3d>
        serial_putc_sub('\b');
  1012f8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012ff:	e8 81 ff ff ff       	call   101285 <serial_putc_sub>
        serial_putc_sub(' ');
  101304:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10130b:	e8 75 ff ff ff       	call   101285 <serial_putc_sub>
        serial_putc_sub('\b');
  101310:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101317:	e8 69 ff ff ff       	call   101285 <serial_putc_sub>
}
  10131c:	90                   	nop
  10131d:	c9                   	leave  
  10131e:	c3                   	ret    

0010131f <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  10131f:	55                   	push   %ebp
  101320:	89 e5                	mov    %esp,%ebp
  101322:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101325:	eb 33                	jmp    10135a <cons_intr+0x3b>
        if (c != 0) {
  101327:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10132b:	74 2d                	je     10135a <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  10132d:	a1 84 00 11 00       	mov    0x110084,%eax
  101332:	8d 50 01             	lea    0x1(%eax),%edx
  101335:	89 15 84 00 11 00    	mov    %edx,0x110084
  10133b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10133e:	88 90 80 fe 10 00    	mov    %dl,0x10fe80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101344:	a1 84 00 11 00       	mov    0x110084,%eax
  101349:	3d 00 02 00 00       	cmp    $0x200,%eax
  10134e:	75 0a                	jne    10135a <cons_intr+0x3b>
                cons.wpos = 0;
  101350:	c7 05 84 00 11 00 00 	movl   $0x0,0x110084
  101357:	00 00 00 
    while ((c = (*proc)()) != -1) {
  10135a:	8b 45 08             	mov    0x8(%ebp),%eax
  10135d:	ff d0                	call   *%eax
  10135f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101362:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101366:	75 bf                	jne    101327 <cons_intr+0x8>
            }
        }
    }
}
  101368:	90                   	nop
  101369:	90                   	nop
  10136a:	c9                   	leave  
  10136b:	c3                   	ret    

0010136c <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10136c:	55                   	push   %ebp
  10136d:	89 e5                	mov    %esp,%ebp
  10136f:	83 ec 10             	sub    $0x10,%esp
  101372:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101378:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10137c:	89 c2                	mov    %eax,%edx
  10137e:	ec                   	in     (%dx),%al
  10137f:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101382:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101386:	0f b6 c0             	movzbl %al,%eax
  101389:	83 e0 01             	and    $0x1,%eax
  10138c:	85 c0                	test   %eax,%eax
  10138e:	75 07                	jne    101397 <serial_proc_data+0x2b>
        return -1;
  101390:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101395:	eb 2a                	jmp    1013c1 <serial_proc_data+0x55>
  101397:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10139d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  1013a1:	89 c2                	mov    %eax,%edx
  1013a3:	ec                   	in     (%dx),%al
  1013a4:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  1013a7:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013ab:	0f b6 c0             	movzbl %al,%eax
  1013ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1013b1:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1013b5:	75 07                	jne    1013be <serial_proc_data+0x52>
        c = '\b';
  1013b7:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013be:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013c1:	c9                   	leave  
  1013c2:	c3                   	ret    

001013c3 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013c3:	55                   	push   %ebp
  1013c4:	89 e5                	mov    %esp,%ebp
  1013c6:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013c9:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  1013ce:	85 c0                	test   %eax,%eax
  1013d0:	74 0c                	je     1013de <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013d2:	c7 04 24 6c 13 10 00 	movl   $0x10136c,(%esp)
  1013d9:	e8 41 ff ff ff       	call   10131f <cons_intr>
    }
}
  1013de:	90                   	nop
  1013df:	c9                   	leave  
  1013e0:	c3                   	ret    

001013e1 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013e1:	55                   	push   %ebp
  1013e2:	89 e5                	mov    %esp,%ebp
  1013e4:	83 ec 38             	sub    $0x38,%esp
  1013e7:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1013f0:	89 c2                	mov    %eax,%edx
  1013f2:	ec                   	in     (%dx),%al
  1013f3:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013f6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013fa:	0f b6 c0             	movzbl %al,%eax
  1013fd:	83 e0 01             	and    $0x1,%eax
  101400:	85 c0                	test   %eax,%eax
  101402:	75 0a                	jne    10140e <kbd_proc_data+0x2d>
        return -1;
  101404:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101409:	e9 56 01 00 00       	jmp    101564 <kbd_proc_data+0x183>
  10140e:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101414:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101417:	89 c2                	mov    %eax,%edx
  101419:	ec                   	in     (%dx),%al
  10141a:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  10141d:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  101421:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101424:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101428:	75 17                	jne    101441 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  10142a:	a1 88 00 11 00       	mov    0x110088,%eax
  10142f:	83 c8 40             	or     $0x40,%eax
  101432:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101437:	b8 00 00 00 00       	mov    $0x0,%eax
  10143c:	e9 23 01 00 00       	jmp    101564 <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  101441:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101445:	84 c0                	test   %al,%al
  101447:	79 45                	jns    10148e <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101449:	a1 88 00 11 00       	mov    0x110088,%eax
  10144e:	83 e0 40             	and    $0x40,%eax
  101451:	85 c0                	test   %eax,%eax
  101453:	75 08                	jne    10145d <kbd_proc_data+0x7c>
  101455:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101459:	24 7f                	and    $0x7f,%al
  10145b:	eb 04                	jmp    101461 <kbd_proc_data+0x80>
  10145d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101461:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101464:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101468:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  10146f:	0c 40                	or     $0x40,%al
  101471:	0f b6 c0             	movzbl %al,%eax
  101474:	f7 d0                	not    %eax
  101476:	89 c2                	mov    %eax,%edx
  101478:	a1 88 00 11 00       	mov    0x110088,%eax
  10147d:	21 d0                	and    %edx,%eax
  10147f:	a3 88 00 11 00       	mov    %eax,0x110088
        return 0;
  101484:	b8 00 00 00 00       	mov    $0x0,%eax
  101489:	e9 d6 00 00 00       	jmp    101564 <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  10148e:	a1 88 00 11 00       	mov    0x110088,%eax
  101493:	83 e0 40             	and    $0x40,%eax
  101496:	85 c0                	test   %eax,%eax
  101498:	74 11                	je     1014ab <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10149a:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10149e:	a1 88 00 11 00       	mov    0x110088,%eax
  1014a3:	83 e0 bf             	and    $0xffffffbf,%eax
  1014a6:	a3 88 00 11 00       	mov    %eax,0x110088
    }

    shift |= shiftcode[data];
  1014ab:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014af:	0f b6 80 40 f0 10 00 	movzbl 0x10f040(%eax),%eax
  1014b6:	0f b6 d0             	movzbl %al,%edx
  1014b9:	a1 88 00 11 00       	mov    0x110088,%eax
  1014be:	09 d0                	or     %edx,%eax
  1014c0:	a3 88 00 11 00       	mov    %eax,0x110088
    shift ^= togglecode[data];
  1014c5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014c9:	0f b6 80 40 f1 10 00 	movzbl 0x10f140(%eax),%eax
  1014d0:	0f b6 d0             	movzbl %al,%edx
  1014d3:	a1 88 00 11 00       	mov    0x110088,%eax
  1014d8:	31 d0                	xor    %edx,%eax
  1014da:	a3 88 00 11 00       	mov    %eax,0x110088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014df:	a1 88 00 11 00       	mov    0x110088,%eax
  1014e4:	83 e0 03             	and    $0x3,%eax
  1014e7:	8b 14 85 40 f5 10 00 	mov    0x10f540(,%eax,4),%edx
  1014ee:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f2:	01 d0                	add    %edx,%eax
  1014f4:	0f b6 00             	movzbl (%eax),%eax
  1014f7:	0f b6 c0             	movzbl %al,%eax
  1014fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014fd:	a1 88 00 11 00       	mov    0x110088,%eax
  101502:	83 e0 08             	and    $0x8,%eax
  101505:	85 c0                	test   %eax,%eax
  101507:	74 22                	je     10152b <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  101509:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  10150d:	7e 0c                	jle    10151b <kbd_proc_data+0x13a>
  10150f:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101513:	7f 06                	jg     10151b <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  101515:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101519:	eb 10                	jmp    10152b <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  10151b:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10151f:	7e 0a                	jle    10152b <kbd_proc_data+0x14a>
  101521:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101525:	7f 04                	jg     10152b <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101527:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10152b:	a1 88 00 11 00       	mov    0x110088,%eax
  101530:	f7 d0                	not    %eax
  101532:	83 e0 06             	and    $0x6,%eax
  101535:	85 c0                	test   %eax,%eax
  101537:	75 28                	jne    101561 <kbd_proc_data+0x180>
  101539:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101540:	75 1f                	jne    101561 <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101542:	c7 04 24 0d 36 10 00 	movl   $0x10360d,(%esp)
  101549:	e8 0a ed ff ff       	call   100258 <cprintf>
  10154e:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101554:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101558:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  10155c:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10155f:	ee                   	out    %al,(%dx)
}
  101560:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101561:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101564:	c9                   	leave  
  101565:	c3                   	ret    

00101566 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101566:	55                   	push   %ebp
  101567:	89 e5                	mov    %esp,%ebp
  101569:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10156c:	c7 04 24 e1 13 10 00 	movl   $0x1013e1,(%esp)
  101573:	e8 a7 fd ff ff       	call   10131f <cons_intr>
}
  101578:	90                   	nop
  101579:	c9                   	leave  
  10157a:	c3                   	ret    

0010157b <kbd_init>:

static void
kbd_init(void) {
  10157b:	55                   	push   %ebp
  10157c:	89 e5                	mov    %esp,%ebp
  10157e:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101581:	e8 e0 ff ff ff       	call   101566 <kbd_intr>
    pic_enable(IRQ_KBD);
  101586:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10158d:	e8 11 01 00 00       	call   1016a3 <pic_enable>
}
  101592:	90                   	nop
  101593:	c9                   	leave  
  101594:	c3                   	ret    

00101595 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101595:	55                   	push   %ebp
  101596:	89 e5                	mov    %esp,%ebp
  101598:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10159b:	e8 66 f8 ff ff       	call   100e06 <cga_init>
    serial_init();
  1015a0:	e8 47 f9 ff ff       	call   100eec <serial_init>
    kbd_init();
  1015a5:	e8 d1 ff ff ff       	call   10157b <kbd_init>
    if (!serial_exists) {
  1015aa:	a1 68 fe 10 00       	mov    0x10fe68,%eax
  1015af:	85 c0                	test   %eax,%eax
  1015b1:	75 0c                	jne    1015bf <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1015b3:	c7 04 24 19 36 10 00 	movl   $0x103619,(%esp)
  1015ba:	e8 99 ec ff ff       	call   100258 <cprintf>
    }
}
  1015bf:	90                   	nop
  1015c0:	c9                   	leave  
  1015c1:	c3                   	ret    

001015c2 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015c2:	55                   	push   %ebp
  1015c3:	89 e5                	mov    %esp,%ebp
  1015c5:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1015cb:	89 04 24             	mov    %eax,(%esp)
  1015ce:	e8 80 fa ff ff       	call   101053 <lpt_putc>
    cga_putc(c);
  1015d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1015d6:	89 04 24             	mov    %eax,(%esp)
  1015d9:	e8 b5 fa ff ff       	call   101093 <cga_putc>
    serial_putc(c);
  1015de:	8b 45 08             	mov    0x8(%ebp),%eax
  1015e1:	89 04 24             	mov    %eax,(%esp)
  1015e4:	e8 f6 fc ff ff       	call   1012df <serial_putc>
}
  1015e9:	90                   	nop
  1015ea:	c9                   	leave  
  1015eb:	c3                   	ret    

001015ec <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015ec:	55                   	push   %ebp
  1015ed:	89 e5                	mov    %esp,%ebp
  1015ef:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015f2:	e8 cc fd ff ff       	call   1013c3 <serial_intr>
    kbd_intr();
  1015f7:	e8 6a ff ff ff       	call   101566 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015fc:	8b 15 80 00 11 00    	mov    0x110080,%edx
  101602:	a1 84 00 11 00       	mov    0x110084,%eax
  101607:	39 c2                	cmp    %eax,%edx
  101609:	74 36                	je     101641 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  10160b:	a1 80 00 11 00       	mov    0x110080,%eax
  101610:	8d 50 01             	lea    0x1(%eax),%edx
  101613:	89 15 80 00 11 00    	mov    %edx,0x110080
  101619:	0f b6 80 80 fe 10 00 	movzbl 0x10fe80(%eax),%eax
  101620:	0f b6 c0             	movzbl %al,%eax
  101623:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101626:	a1 80 00 11 00       	mov    0x110080,%eax
  10162b:	3d 00 02 00 00       	cmp    $0x200,%eax
  101630:	75 0a                	jne    10163c <cons_getc+0x50>
            cons.rpos = 0;
  101632:	c7 05 80 00 11 00 00 	movl   $0x0,0x110080
  101639:	00 00 00 
        }
        return c;
  10163c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10163f:	eb 05                	jmp    101646 <cons_getc+0x5a>
    }
    return 0;
  101641:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101646:	c9                   	leave  
  101647:	c3                   	ret    

00101648 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101648:	55                   	push   %ebp
  101649:	89 e5                	mov    %esp,%ebp
  10164b:	83 ec 14             	sub    $0x14,%esp
  10164e:	8b 45 08             	mov    0x8(%ebp),%eax
  101651:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101655:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101658:	66 a3 50 f5 10 00    	mov    %ax,0x10f550
    if (did_init) {
  10165e:	a1 8c 00 11 00       	mov    0x11008c,%eax
  101663:	85 c0                	test   %eax,%eax
  101665:	74 39                	je     1016a0 <pic_setmask+0x58>
        outb(IO_PIC1 + 1, mask);
  101667:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10166a:	0f b6 c0             	movzbl %al,%eax
  10166d:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101673:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101676:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10167a:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10167e:	ee                   	out    %al,(%dx)
}
  10167f:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101680:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101684:	c1 e8 08             	shr    $0x8,%eax
  101687:	0f b7 c0             	movzwl %ax,%eax
  10168a:	0f b6 c0             	movzbl %al,%eax
  10168d:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101693:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101696:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10169a:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10169e:	ee                   	out    %al,(%dx)
}
  10169f:	90                   	nop
    }
}
  1016a0:	90                   	nop
  1016a1:	c9                   	leave  
  1016a2:	c3                   	ret    

001016a3 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1016a3:	55                   	push   %ebp
  1016a4:	89 e5                	mov    %esp,%ebp
  1016a6:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1016ac:	ba 01 00 00 00       	mov    $0x1,%edx
  1016b1:	88 c1                	mov    %al,%cl
  1016b3:	d3 e2                	shl    %cl,%edx
  1016b5:	89 d0                	mov    %edx,%eax
  1016b7:	98                   	cwtl   
  1016b8:	f7 d0                	not    %eax
  1016ba:	0f bf d0             	movswl %ax,%edx
  1016bd:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  1016c4:	98                   	cwtl   
  1016c5:	21 d0                	and    %edx,%eax
  1016c7:	98                   	cwtl   
  1016c8:	0f b7 c0             	movzwl %ax,%eax
  1016cb:	89 04 24             	mov    %eax,(%esp)
  1016ce:	e8 75 ff ff ff       	call   101648 <pic_setmask>
}
  1016d3:	90                   	nop
  1016d4:	c9                   	leave  
  1016d5:	c3                   	ret    

001016d6 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016d6:	55                   	push   %ebp
  1016d7:	89 e5                	mov    %esp,%ebp
  1016d9:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016dc:	c7 05 8c 00 11 00 01 	movl   $0x1,0x11008c
  1016e3:	00 00 00 
  1016e6:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1016ec:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1016f0:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1016f4:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1016f8:	ee                   	out    %al,(%dx)
}
  1016f9:	90                   	nop
  1016fa:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  101700:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101704:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  101708:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  10170c:	ee                   	out    %al,(%dx)
}
  10170d:	90                   	nop
  10170e:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101714:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101718:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  10171c:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101720:	ee                   	out    %al,(%dx)
}
  101721:	90                   	nop
  101722:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  101728:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10172c:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  101730:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101734:	ee                   	out    %al,(%dx)
}
  101735:	90                   	nop
  101736:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  10173c:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101740:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101744:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101748:	ee                   	out    %al,(%dx)
}
  101749:	90                   	nop
  10174a:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  101750:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101754:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101758:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10175c:	ee                   	out    %al,(%dx)
}
  10175d:	90                   	nop
  10175e:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  101764:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101768:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10176c:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101770:	ee                   	out    %al,(%dx)
}
  101771:	90                   	nop
  101772:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101778:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10177c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101780:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101784:	ee                   	out    %al,(%dx)
}
  101785:	90                   	nop
  101786:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  10178c:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101790:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101794:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101798:	ee                   	out    %al,(%dx)
}
  101799:	90                   	nop
  10179a:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  1017a0:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017a4:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1017a8:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1017ac:	ee                   	out    %al,(%dx)
}
  1017ad:	90                   	nop
  1017ae:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  1017b4:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017b8:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1017bc:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1017c0:	ee                   	out    %al,(%dx)
}
  1017c1:	90                   	nop
  1017c2:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1017c8:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017cc:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1017d0:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1017d4:	ee                   	out    %al,(%dx)
}
  1017d5:	90                   	nop
  1017d6:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1017dc:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e0:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1017e4:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1017e8:	ee                   	out    %al,(%dx)
}
  1017e9:	90                   	nop
  1017ea:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1017f0:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017f4:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1017f8:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1017fc:	ee                   	out    %al,(%dx)
}
  1017fd:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017fe:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101805:	3d ff ff 00 00       	cmp    $0xffff,%eax
  10180a:	74 0f                	je     10181b <pic_init+0x145>
        pic_setmask(irq_mask);
  10180c:	0f b7 05 50 f5 10 00 	movzwl 0x10f550,%eax
  101813:	89 04 24             	mov    %eax,(%esp)
  101816:	e8 2d fe ff ff       	call   101648 <pic_setmask>
    }
}
  10181b:	90                   	nop
  10181c:	c9                   	leave  
  10181d:	c3                   	ret    

0010181e <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  10181e:	55                   	push   %ebp
  10181f:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101821:	fb                   	sti    
}
  101822:	90                   	nop
    sti();
}
  101823:	90                   	nop
  101824:	5d                   	pop    %ebp
  101825:	c3                   	ret    

00101826 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101826:	55                   	push   %ebp
  101827:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  101829:	fa                   	cli    
}
  10182a:	90                   	nop
    cli();
}
  10182b:	90                   	nop
  10182c:	5d                   	pop    %ebp
  10182d:	c3                   	ret    

0010182e <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  10182e:	55                   	push   %ebp
  10182f:	89 e5                	mov    %esp,%ebp
  101831:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  101834:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  10183b:	00 
  10183c:	c7 04 24 40 36 10 00 	movl   $0x103640,(%esp)
  101843:	e8 10 ea ff ff       	call   100258 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  101848:	90                   	nop
  101849:	c9                   	leave  
  10184a:	c3                   	ret    

0010184b <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  10184b:	55                   	push   %ebp
  10184c:	89 e5                	mov    %esp,%ebp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
}
  10184e:	90                   	nop
  10184f:	5d                   	pop    %ebp
  101850:	c3                   	ret    

00101851 <trapname>:

static const char *
trapname(int trapno) {
  101851:	55                   	push   %ebp
  101852:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101854:	8b 45 08             	mov    0x8(%ebp),%eax
  101857:	83 f8 13             	cmp    $0x13,%eax
  10185a:	77 0c                	ja     101868 <trapname+0x17>
        return excnames[trapno];
  10185c:	8b 45 08             	mov    0x8(%ebp),%eax
  10185f:	8b 04 85 a0 39 10 00 	mov    0x1039a0(,%eax,4),%eax
  101866:	eb 18                	jmp    101880 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101868:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  10186c:	7e 0d                	jle    10187b <trapname+0x2a>
  10186e:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101872:	7f 07                	jg     10187b <trapname+0x2a>
        return "Hardware Interrupt";
  101874:	b8 4a 36 10 00       	mov    $0x10364a,%eax
  101879:	eb 05                	jmp    101880 <trapname+0x2f>
    }
    return "(unknown trap)";
  10187b:	b8 5d 36 10 00       	mov    $0x10365d,%eax
}
  101880:	5d                   	pop    %ebp
  101881:	c3                   	ret    

00101882 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101882:	55                   	push   %ebp
  101883:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101885:	8b 45 08             	mov    0x8(%ebp),%eax
  101888:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  10188c:	83 f8 08             	cmp    $0x8,%eax
  10188f:	0f 94 c0             	sete   %al
  101892:	0f b6 c0             	movzbl %al,%eax
}
  101895:	5d                   	pop    %ebp
  101896:	c3                   	ret    

00101897 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101897:	55                   	push   %ebp
  101898:	89 e5                	mov    %esp,%ebp
  10189a:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  10189d:	8b 45 08             	mov    0x8(%ebp),%eax
  1018a0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018a4:	c7 04 24 9e 36 10 00 	movl   $0x10369e,(%esp)
  1018ab:	e8 a8 e9 ff ff       	call   100258 <cprintf>
    print_regs(&tf->tf_regs);
  1018b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1018b3:	89 04 24             	mov    %eax,(%esp)
  1018b6:	e8 8d 01 00 00       	call   101a48 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1018bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1018be:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1018c2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018c6:	c7 04 24 af 36 10 00 	movl   $0x1036af,(%esp)
  1018cd:	e8 86 e9 ff ff       	call   100258 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1018d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1018d5:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1018d9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018dd:	c7 04 24 c2 36 10 00 	movl   $0x1036c2,(%esp)
  1018e4:	e8 6f e9 ff ff       	call   100258 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  1018e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1018ec:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  1018f0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1018f4:	c7 04 24 d5 36 10 00 	movl   $0x1036d5,(%esp)
  1018fb:	e8 58 e9 ff ff       	call   100258 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101900:	8b 45 08             	mov    0x8(%ebp),%eax
  101903:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101907:	89 44 24 04          	mov    %eax,0x4(%esp)
  10190b:	c7 04 24 e8 36 10 00 	movl   $0x1036e8,(%esp)
  101912:	e8 41 e9 ff ff       	call   100258 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101917:	8b 45 08             	mov    0x8(%ebp),%eax
  10191a:	8b 40 30             	mov    0x30(%eax),%eax
  10191d:	89 04 24             	mov    %eax,(%esp)
  101920:	e8 2c ff ff ff       	call   101851 <trapname>
  101925:	8b 55 08             	mov    0x8(%ebp),%edx
  101928:	8b 52 30             	mov    0x30(%edx),%edx
  10192b:	89 44 24 08          	mov    %eax,0x8(%esp)
  10192f:	89 54 24 04          	mov    %edx,0x4(%esp)
  101933:	c7 04 24 fb 36 10 00 	movl   $0x1036fb,(%esp)
  10193a:	e8 19 e9 ff ff       	call   100258 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  10193f:	8b 45 08             	mov    0x8(%ebp),%eax
  101942:	8b 40 34             	mov    0x34(%eax),%eax
  101945:	89 44 24 04          	mov    %eax,0x4(%esp)
  101949:	c7 04 24 0d 37 10 00 	movl   $0x10370d,(%esp)
  101950:	e8 03 e9 ff ff       	call   100258 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101955:	8b 45 08             	mov    0x8(%ebp),%eax
  101958:	8b 40 38             	mov    0x38(%eax),%eax
  10195b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10195f:	c7 04 24 1c 37 10 00 	movl   $0x10371c,(%esp)
  101966:	e8 ed e8 ff ff       	call   100258 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  10196b:	8b 45 08             	mov    0x8(%ebp),%eax
  10196e:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101972:	89 44 24 04          	mov    %eax,0x4(%esp)
  101976:	c7 04 24 2b 37 10 00 	movl   $0x10372b,(%esp)
  10197d:	e8 d6 e8 ff ff       	call   100258 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101982:	8b 45 08             	mov    0x8(%ebp),%eax
  101985:	8b 40 40             	mov    0x40(%eax),%eax
  101988:	89 44 24 04          	mov    %eax,0x4(%esp)
  10198c:	c7 04 24 3e 37 10 00 	movl   $0x10373e,(%esp)
  101993:	e8 c0 e8 ff ff       	call   100258 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101998:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10199f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  1019a6:	eb 3d                	jmp    1019e5 <print_trapframe+0x14e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  1019a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ab:	8b 50 40             	mov    0x40(%eax),%edx
  1019ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1019b1:	21 d0                	and    %edx,%eax
  1019b3:	85 c0                	test   %eax,%eax
  1019b5:	74 28                	je     1019df <print_trapframe+0x148>
  1019b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019ba:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  1019c1:	85 c0                	test   %eax,%eax
  1019c3:	74 1a                	je     1019df <print_trapframe+0x148>
            cprintf("%s,", IA32flags[i]);
  1019c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019c8:	8b 04 85 80 f5 10 00 	mov    0x10f580(,%eax,4),%eax
  1019cf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019d3:	c7 04 24 4d 37 10 00 	movl   $0x10374d,(%esp)
  1019da:	e8 79 e8 ff ff       	call   100258 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  1019df:	ff 45 f4             	incl   -0xc(%ebp)
  1019e2:	d1 65 f0             	shll   -0x10(%ebp)
  1019e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1019e8:	83 f8 17             	cmp    $0x17,%eax
  1019eb:	76 bb                	jbe    1019a8 <print_trapframe+0x111>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  1019ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f0:	8b 40 40             	mov    0x40(%eax),%eax
  1019f3:	c1 e8 0c             	shr    $0xc,%eax
  1019f6:	83 e0 03             	and    $0x3,%eax
  1019f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019fd:	c7 04 24 51 37 10 00 	movl   $0x103751,(%esp)
  101a04:	e8 4f e8 ff ff       	call   100258 <cprintf>

    if (!trap_in_kernel(tf)) {
  101a09:	8b 45 08             	mov    0x8(%ebp),%eax
  101a0c:	89 04 24             	mov    %eax,(%esp)
  101a0f:	e8 6e fe ff ff       	call   101882 <trap_in_kernel>
  101a14:	85 c0                	test   %eax,%eax
  101a16:	75 2d                	jne    101a45 <print_trapframe+0x1ae>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101a18:	8b 45 08             	mov    0x8(%ebp),%eax
  101a1b:	8b 40 44             	mov    0x44(%eax),%eax
  101a1e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a22:	c7 04 24 5a 37 10 00 	movl   $0x10375a,(%esp)
  101a29:	e8 2a e8 ff ff       	call   100258 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101a2e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a31:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101a35:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a39:	c7 04 24 69 37 10 00 	movl   $0x103769,(%esp)
  101a40:	e8 13 e8 ff ff       	call   100258 <cprintf>
    }
}
  101a45:	90                   	nop
  101a46:	c9                   	leave  
  101a47:	c3                   	ret    

00101a48 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101a48:	55                   	push   %ebp
  101a49:	89 e5                	mov    %esp,%ebp
  101a4b:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101a4e:	8b 45 08             	mov    0x8(%ebp),%eax
  101a51:	8b 00                	mov    (%eax),%eax
  101a53:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a57:	c7 04 24 7c 37 10 00 	movl   $0x10377c,(%esp)
  101a5e:	e8 f5 e7 ff ff       	call   100258 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101a63:	8b 45 08             	mov    0x8(%ebp),%eax
  101a66:	8b 40 04             	mov    0x4(%eax),%eax
  101a69:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a6d:	c7 04 24 8b 37 10 00 	movl   $0x10378b,(%esp)
  101a74:	e8 df e7 ff ff       	call   100258 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101a79:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7c:	8b 40 08             	mov    0x8(%eax),%eax
  101a7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a83:	c7 04 24 9a 37 10 00 	movl   $0x10379a,(%esp)
  101a8a:	e8 c9 e7 ff ff       	call   100258 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101a8f:	8b 45 08             	mov    0x8(%ebp),%eax
  101a92:	8b 40 0c             	mov    0xc(%eax),%eax
  101a95:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a99:	c7 04 24 a9 37 10 00 	movl   $0x1037a9,(%esp)
  101aa0:	e8 b3 e7 ff ff       	call   100258 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101aa5:	8b 45 08             	mov    0x8(%ebp),%eax
  101aa8:	8b 40 10             	mov    0x10(%eax),%eax
  101aab:	89 44 24 04          	mov    %eax,0x4(%esp)
  101aaf:	c7 04 24 b8 37 10 00 	movl   $0x1037b8,(%esp)
  101ab6:	e8 9d e7 ff ff       	call   100258 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101abb:	8b 45 08             	mov    0x8(%ebp),%eax
  101abe:	8b 40 14             	mov    0x14(%eax),%eax
  101ac1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac5:	c7 04 24 c7 37 10 00 	movl   $0x1037c7,(%esp)
  101acc:	e8 87 e7 ff ff       	call   100258 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad4:	8b 40 18             	mov    0x18(%eax),%eax
  101ad7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101adb:	c7 04 24 d6 37 10 00 	movl   $0x1037d6,(%esp)
  101ae2:	e8 71 e7 ff ff       	call   100258 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101ae7:	8b 45 08             	mov    0x8(%ebp),%eax
  101aea:	8b 40 1c             	mov    0x1c(%eax),%eax
  101aed:	89 44 24 04          	mov    %eax,0x4(%esp)
  101af1:	c7 04 24 e5 37 10 00 	movl   $0x1037e5,(%esp)
  101af8:	e8 5b e7 ff ff       	call   100258 <cprintf>
}
  101afd:	90                   	nop
  101afe:	c9                   	leave  
  101aff:	c3                   	ret    

00101b00 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101b00:	55                   	push   %ebp
  101b01:	89 e5                	mov    %esp,%ebp
  101b03:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101b06:	8b 45 08             	mov    0x8(%ebp),%eax
  101b09:	8b 40 30             	mov    0x30(%eax),%eax
  101b0c:	83 f8 79             	cmp    $0x79,%eax
  101b0f:	0f 87 99 00 00 00    	ja     101bae <trap_dispatch+0xae>
  101b15:	83 f8 78             	cmp    $0x78,%eax
  101b18:	73 78                	jae    101b92 <trap_dispatch+0x92>
  101b1a:	83 f8 2f             	cmp    $0x2f,%eax
  101b1d:	0f 87 8b 00 00 00    	ja     101bae <trap_dispatch+0xae>
  101b23:	83 f8 2e             	cmp    $0x2e,%eax
  101b26:	0f 83 b7 00 00 00    	jae    101be3 <trap_dispatch+0xe3>
  101b2c:	83 f8 24             	cmp    $0x24,%eax
  101b2f:	74 15                	je     101b46 <trap_dispatch+0x46>
  101b31:	83 f8 24             	cmp    $0x24,%eax
  101b34:	77 78                	ja     101bae <trap_dispatch+0xae>
  101b36:	83 f8 20             	cmp    $0x20,%eax
  101b39:	0f 84 a7 00 00 00    	je     101be6 <trap_dispatch+0xe6>
  101b3f:	83 f8 21             	cmp    $0x21,%eax
  101b42:	74 28                	je     101b6c <trap_dispatch+0x6c>
  101b44:	eb 68                	jmp    101bae <trap_dispatch+0xae>
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        break;
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101b46:	e8 a1 fa ff ff       	call   1015ec <cons_getc>
  101b4b:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101b4e:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b52:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b56:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b5a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b5e:	c7 04 24 f4 37 10 00 	movl   $0x1037f4,(%esp)
  101b65:	e8 ee e6 ff ff       	call   100258 <cprintf>
        break;
  101b6a:	eb 7b                	jmp    101be7 <trap_dispatch+0xe7>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101b6c:	e8 7b fa ff ff       	call   1015ec <cons_getc>
  101b71:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101b74:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101b78:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101b7c:	89 54 24 08          	mov    %edx,0x8(%esp)
  101b80:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b84:	c7 04 24 06 38 10 00 	movl   $0x103806,(%esp)
  101b8b:	e8 c8 e6 ff ff       	call   100258 <cprintf>
        break;
  101b90:	eb 55                	jmp    101be7 <trap_dispatch+0xe7>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101b92:	c7 44 24 08 15 38 10 	movl   $0x103815,0x8(%esp)
  101b99:	00 
  101b9a:	c7 44 24 04 a2 00 00 	movl   $0xa2,0x4(%esp)
  101ba1:	00 
  101ba2:	c7 04 24 25 38 10 00 	movl   $0x103825,(%esp)
  101ba9:	e8 02 e8 ff ff       	call   1003b0 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101bae:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101bb5:	83 e0 03             	and    $0x3,%eax
  101bb8:	85 c0                	test   %eax,%eax
  101bba:	75 2b                	jne    101be7 <trap_dispatch+0xe7>
            print_trapframe(tf);
  101bbc:	8b 45 08             	mov    0x8(%ebp),%eax
  101bbf:	89 04 24             	mov    %eax,(%esp)
  101bc2:	e8 d0 fc ff ff       	call   101897 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101bc7:	c7 44 24 08 36 38 10 	movl   $0x103836,0x8(%esp)
  101bce:	00 
  101bcf:	c7 44 24 04 ac 00 00 	movl   $0xac,0x4(%esp)
  101bd6:	00 
  101bd7:	c7 04 24 25 38 10 00 	movl   $0x103825,(%esp)
  101bde:	e8 cd e7 ff ff       	call   1003b0 <__panic>
        break;
  101be3:	90                   	nop
  101be4:	eb 01                	jmp    101be7 <trap_dispatch+0xe7>
        break;
  101be6:	90                   	nop
        }
    }
}
  101be7:	90                   	nop
  101be8:	c9                   	leave  
  101be9:	c3                   	ret    

00101bea <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101bea:	55                   	push   %ebp
  101beb:	89 e5                	mov    %esp,%ebp
  101bed:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101bf0:	8b 45 08             	mov    0x8(%ebp),%eax
  101bf3:	89 04 24             	mov    %eax,(%esp)
  101bf6:	e8 05 ff ff ff       	call   101b00 <trap_dispatch>
}
  101bfb:	90                   	nop
  101bfc:	c9                   	leave  
  101bfd:	c3                   	ret    

00101bfe <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101bfe:	6a 00                	push   $0x0
  pushl $0
  101c00:	6a 00                	push   $0x0
  jmp __alltraps
  101c02:	e9 69 0a 00 00       	jmp    102670 <__alltraps>

00101c07 <vector1>:
.globl vector1
vector1:
  pushl $0
  101c07:	6a 00                	push   $0x0
  pushl $1
  101c09:	6a 01                	push   $0x1
  jmp __alltraps
  101c0b:	e9 60 0a 00 00       	jmp    102670 <__alltraps>

00101c10 <vector2>:
.globl vector2
vector2:
  pushl $0
  101c10:	6a 00                	push   $0x0
  pushl $2
  101c12:	6a 02                	push   $0x2
  jmp __alltraps
  101c14:	e9 57 0a 00 00       	jmp    102670 <__alltraps>

00101c19 <vector3>:
.globl vector3
vector3:
  pushl $0
  101c19:	6a 00                	push   $0x0
  pushl $3
  101c1b:	6a 03                	push   $0x3
  jmp __alltraps
  101c1d:	e9 4e 0a 00 00       	jmp    102670 <__alltraps>

00101c22 <vector4>:
.globl vector4
vector4:
  pushl $0
  101c22:	6a 00                	push   $0x0
  pushl $4
  101c24:	6a 04                	push   $0x4
  jmp __alltraps
  101c26:	e9 45 0a 00 00       	jmp    102670 <__alltraps>

00101c2b <vector5>:
.globl vector5
vector5:
  pushl $0
  101c2b:	6a 00                	push   $0x0
  pushl $5
  101c2d:	6a 05                	push   $0x5
  jmp __alltraps
  101c2f:	e9 3c 0a 00 00       	jmp    102670 <__alltraps>

00101c34 <vector6>:
.globl vector6
vector6:
  pushl $0
  101c34:	6a 00                	push   $0x0
  pushl $6
  101c36:	6a 06                	push   $0x6
  jmp __alltraps
  101c38:	e9 33 0a 00 00       	jmp    102670 <__alltraps>

00101c3d <vector7>:
.globl vector7
vector7:
  pushl $0
  101c3d:	6a 00                	push   $0x0
  pushl $7
  101c3f:	6a 07                	push   $0x7
  jmp __alltraps
  101c41:	e9 2a 0a 00 00       	jmp    102670 <__alltraps>

00101c46 <vector8>:
.globl vector8
vector8:
  pushl $8
  101c46:	6a 08                	push   $0x8
  jmp __alltraps
  101c48:	e9 23 0a 00 00       	jmp    102670 <__alltraps>

00101c4d <vector9>:
.globl vector9
vector9:
  pushl $0
  101c4d:	6a 00                	push   $0x0
  pushl $9
  101c4f:	6a 09                	push   $0x9
  jmp __alltraps
  101c51:	e9 1a 0a 00 00       	jmp    102670 <__alltraps>

00101c56 <vector10>:
.globl vector10
vector10:
  pushl $10
  101c56:	6a 0a                	push   $0xa
  jmp __alltraps
  101c58:	e9 13 0a 00 00       	jmp    102670 <__alltraps>

00101c5d <vector11>:
.globl vector11
vector11:
  pushl $11
  101c5d:	6a 0b                	push   $0xb
  jmp __alltraps
  101c5f:	e9 0c 0a 00 00       	jmp    102670 <__alltraps>

00101c64 <vector12>:
.globl vector12
vector12:
  pushl $12
  101c64:	6a 0c                	push   $0xc
  jmp __alltraps
  101c66:	e9 05 0a 00 00       	jmp    102670 <__alltraps>

00101c6b <vector13>:
.globl vector13
vector13:
  pushl $13
  101c6b:	6a 0d                	push   $0xd
  jmp __alltraps
  101c6d:	e9 fe 09 00 00       	jmp    102670 <__alltraps>

00101c72 <vector14>:
.globl vector14
vector14:
  pushl $14
  101c72:	6a 0e                	push   $0xe
  jmp __alltraps
  101c74:	e9 f7 09 00 00       	jmp    102670 <__alltraps>

00101c79 <vector15>:
.globl vector15
vector15:
  pushl $0
  101c79:	6a 00                	push   $0x0
  pushl $15
  101c7b:	6a 0f                	push   $0xf
  jmp __alltraps
  101c7d:	e9 ee 09 00 00       	jmp    102670 <__alltraps>

00101c82 <vector16>:
.globl vector16
vector16:
  pushl $0
  101c82:	6a 00                	push   $0x0
  pushl $16
  101c84:	6a 10                	push   $0x10
  jmp __alltraps
  101c86:	e9 e5 09 00 00       	jmp    102670 <__alltraps>

00101c8b <vector17>:
.globl vector17
vector17:
  pushl $17
  101c8b:	6a 11                	push   $0x11
  jmp __alltraps
  101c8d:	e9 de 09 00 00       	jmp    102670 <__alltraps>

00101c92 <vector18>:
.globl vector18
vector18:
  pushl $0
  101c92:	6a 00                	push   $0x0
  pushl $18
  101c94:	6a 12                	push   $0x12
  jmp __alltraps
  101c96:	e9 d5 09 00 00       	jmp    102670 <__alltraps>

00101c9b <vector19>:
.globl vector19
vector19:
  pushl $0
  101c9b:	6a 00                	push   $0x0
  pushl $19
  101c9d:	6a 13                	push   $0x13
  jmp __alltraps
  101c9f:	e9 cc 09 00 00       	jmp    102670 <__alltraps>

00101ca4 <vector20>:
.globl vector20
vector20:
  pushl $0
  101ca4:	6a 00                	push   $0x0
  pushl $20
  101ca6:	6a 14                	push   $0x14
  jmp __alltraps
  101ca8:	e9 c3 09 00 00       	jmp    102670 <__alltraps>

00101cad <vector21>:
.globl vector21
vector21:
  pushl $0
  101cad:	6a 00                	push   $0x0
  pushl $21
  101caf:	6a 15                	push   $0x15
  jmp __alltraps
  101cb1:	e9 ba 09 00 00       	jmp    102670 <__alltraps>

00101cb6 <vector22>:
.globl vector22
vector22:
  pushl $0
  101cb6:	6a 00                	push   $0x0
  pushl $22
  101cb8:	6a 16                	push   $0x16
  jmp __alltraps
  101cba:	e9 b1 09 00 00       	jmp    102670 <__alltraps>

00101cbf <vector23>:
.globl vector23
vector23:
  pushl $0
  101cbf:	6a 00                	push   $0x0
  pushl $23
  101cc1:	6a 17                	push   $0x17
  jmp __alltraps
  101cc3:	e9 a8 09 00 00       	jmp    102670 <__alltraps>

00101cc8 <vector24>:
.globl vector24
vector24:
  pushl $0
  101cc8:	6a 00                	push   $0x0
  pushl $24
  101cca:	6a 18                	push   $0x18
  jmp __alltraps
  101ccc:	e9 9f 09 00 00       	jmp    102670 <__alltraps>

00101cd1 <vector25>:
.globl vector25
vector25:
  pushl $0
  101cd1:	6a 00                	push   $0x0
  pushl $25
  101cd3:	6a 19                	push   $0x19
  jmp __alltraps
  101cd5:	e9 96 09 00 00       	jmp    102670 <__alltraps>

00101cda <vector26>:
.globl vector26
vector26:
  pushl $0
  101cda:	6a 00                	push   $0x0
  pushl $26
  101cdc:	6a 1a                	push   $0x1a
  jmp __alltraps
  101cde:	e9 8d 09 00 00       	jmp    102670 <__alltraps>

00101ce3 <vector27>:
.globl vector27
vector27:
  pushl $0
  101ce3:	6a 00                	push   $0x0
  pushl $27
  101ce5:	6a 1b                	push   $0x1b
  jmp __alltraps
  101ce7:	e9 84 09 00 00       	jmp    102670 <__alltraps>

00101cec <vector28>:
.globl vector28
vector28:
  pushl $0
  101cec:	6a 00                	push   $0x0
  pushl $28
  101cee:	6a 1c                	push   $0x1c
  jmp __alltraps
  101cf0:	e9 7b 09 00 00       	jmp    102670 <__alltraps>

00101cf5 <vector29>:
.globl vector29
vector29:
  pushl $0
  101cf5:	6a 00                	push   $0x0
  pushl $29
  101cf7:	6a 1d                	push   $0x1d
  jmp __alltraps
  101cf9:	e9 72 09 00 00       	jmp    102670 <__alltraps>

00101cfe <vector30>:
.globl vector30
vector30:
  pushl $0
  101cfe:	6a 00                	push   $0x0
  pushl $30
  101d00:	6a 1e                	push   $0x1e
  jmp __alltraps
  101d02:	e9 69 09 00 00       	jmp    102670 <__alltraps>

00101d07 <vector31>:
.globl vector31
vector31:
  pushl $0
  101d07:	6a 00                	push   $0x0
  pushl $31
  101d09:	6a 1f                	push   $0x1f
  jmp __alltraps
  101d0b:	e9 60 09 00 00       	jmp    102670 <__alltraps>

00101d10 <vector32>:
.globl vector32
vector32:
  pushl $0
  101d10:	6a 00                	push   $0x0
  pushl $32
  101d12:	6a 20                	push   $0x20
  jmp __alltraps
  101d14:	e9 57 09 00 00       	jmp    102670 <__alltraps>

00101d19 <vector33>:
.globl vector33
vector33:
  pushl $0
  101d19:	6a 00                	push   $0x0
  pushl $33
  101d1b:	6a 21                	push   $0x21
  jmp __alltraps
  101d1d:	e9 4e 09 00 00       	jmp    102670 <__alltraps>

00101d22 <vector34>:
.globl vector34
vector34:
  pushl $0
  101d22:	6a 00                	push   $0x0
  pushl $34
  101d24:	6a 22                	push   $0x22
  jmp __alltraps
  101d26:	e9 45 09 00 00       	jmp    102670 <__alltraps>

00101d2b <vector35>:
.globl vector35
vector35:
  pushl $0
  101d2b:	6a 00                	push   $0x0
  pushl $35
  101d2d:	6a 23                	push   $0x23
  jmp __alltraps
  101d2f:	e9 3c 09 00 00       	jmp    102670 <__alltraps>

00101d34 <vector36>:
.globl vector36
vector36:
  pushl $0
  101d34:	6a 00                	push   $0x0
  pushl $36
  101d36:	6a 24                	push   $0x24
  jmp __alltraps
  101d38:	e9 33 09 00 00       	jmp    102670 <__alltraps>

00101d3d <vector37>:
.globl vector37
vector37:
  pushl $0
  101d3d:	6a 00                	push   $0x0
  pushl $37
  101d3f:	6a 25                	push   $0x25
  jmp __alltraps
  101d41:	e9 2a 09 00 00       	jmp    102670 <__alltraps>

00101d46 <vector38>:
.globl vector38
vector38:
  pushl $0
  101d46:	6a 00                	push   $0x0
  pushl $38
  101d48:	6a 26                	push   $0x26
  jmp __alltraps
  101d4a:	e9 21 09 00 00       	jmp    102670 <__alltraps>

00101d4f <vector39>:
.globl vector39
vector39:
  pushl $0
  101d4f:	6a 00                	push   $0x0
  pushl $39
  101d51:	6a 27                	push   $0x27
  jmp __alltraps
  101d53:	e9 18 09 00 00       	jmp    102670 <__alltraps>

00101d58 <vector40>:
.globl vector40
vector40:
  pushl $0
  101d58:	6a 00                	push   $0x0
  pushl $40
  101d5a:	6a 28                	push   $0x28
  jmp __alltraps
  101d5c:	e9 0f 09 00 00       	jmp    102670 <__alltraps>

00101d61 <vector41>:
.globl vector41
vector41:
  pushl $0
  101d61:	6a 00                	push   $0x0
  pushl $41
  101d63:	6a 29                	push   $0x29
  jmp __alltraps
  101d65:	e9 06 09 00 00       	jmp    102670 <__alltraps>

00101d6a <vector42>:
.globl vector42
vector42:
  pushl $0
  101d6a:	6a 00                	push   $0x0
  pushl $42
  101d6c:	6a 2a                	push   $0x2a
  jmp __alltraps
  101d6e:	e9 fd 08 00 00       	jmp    102670 <__alltraps>

00101d73 <vector43>:
.globl vector43
vector43:
  pushl $0
  101d73:	6a 00                	push   $0x0
  pushl $43
  101d75:	6a 2b                	push   $0x2b
  jmp __alltraps
  101d77:	e9 f4 08 00 00       	jmp    102670 <__alltraps>

00101d7c <vector44>:
.globl vector44
vector44:
  pushl $0
  101d7c:	6a 00                	push   $0x0
  pushl $44
  101d7e:	6a 2c                	push   $0x2c
  jmp __alltraps
  101d80:	e9 eb 08 00 00       	jmp    102670 <__alltraps>

00101d85 <vector45>:
.globl vector45
vector45:
  pushl $0
  101d85:	6a 00                	push   $0x0
  pushl $45
  101d87:	6a 2d                	push   $0x2d
  jmp __alltraps
  101d89:	e9 e2 08 00 00       	jmp    102670 <__alltraps>

00101d8e <vector46>:
.globl vector46
vector46:
  pushl $0
  101d8e:	6a 00                	push   $0x0
  pushl $46
  101d90:	6a 2e                	push   $0x2e
  jmp __alltraps
  101d92:	e9 d9 08 00 00       	jmp    102670 <__alltraps>

00101d97 <vector47>:
.globl vector47
vector47:
  pushl $0
  101d97:	6a 00                	push   $0x0
  pushl $47
  101d99:	6a 2f                	push   $0x2f
  jmp __alltraps
  101d9b:	e9 d0 08 00 00       	jmp    102670 <__alltraps>

00101da0 <vector48>:
.globl vector48
vector48:
  pushl $0
  101da0:	6a 00                	push   $0x0
  pushl $48
  101da2:	6a 30                	push   $0x30
  jmp __alltraps
  101da4:	e9 c7 08 00 00       	jmp    102670 <__alltraps>

00101da9 <vector49>:
.globl vector49
vector49:
  pushl $0
  101da9:	6a 00                	push   $0x0
  pushl $49
  101dab:	6a 31                	push   $0x31
  jmp __alltraps
  101dad:	e9 be 08 00 00       	jmp    102670 <__alltraps>

00101db2 <vector50>:
.globl vector50
vector50:
  pushl $0
  101db2:	6a 00                	push   $0x0
  pushl $50
  101db4:	6a 32                	push   $0x32
  jmp __alltraps
  101db6:	e9 b5 08 00 00       	jmp    102670 <__alltraps>

00101dbb <vector51>:
.globl vector51
vector51:
  pushl $0
  101dbb:	6a 00                	push   $0x0
  pushl $51
  101dbd:	6a 33                	push   $0x33
  jmp __alltraps
  101dbf:	e9 ac 08 00 00       	jmp    102670 <__alltraps>

00101dc4 <vector52>:
.globl vector52
vector52:
  pushl $0
  101dc4:	6a 00                	push   $0x0
  pushl $52
  101dc6:	6a 34                	push   $0x34
  jmp __alltraps
  101dc8:	e9 a3 08 00 00       	jmp    102670 <__alltraps>

00101dcd <vector53>:
.globl vector53
vector53:
  pushl $0
  101dcd:	6a 00                	push   $0x0
  pushl $53
  101dcf:	6a 35                	push   $0x35
  jmp __alltraps
  101dd1:	e9 9a 08 00 00       	jmp    102670 <__alltraps>

00101dd6 <vector54>:
.globl vector54
vector54:
  pushl $0
  101dd6:	6a 00                	push   $0x0
  pushl $54
  101dd8:	6a 36                	push   $0x36
  jmp __alltraps
  101dda:	e9 91 08 00 00       	jmp    102670 <__alltraps>

00101ddf <vector55>:
.globl vector55
vector55:
  pushl $0
  101ddf:	6a 00                	push   $0x0
  pushl $55
  101de1:	6a 37                	push   $0x37
  jmp __alltraps
  101de3:	e9 88 08 00 00       	jmp    102670 <__alltraps>

00101de8 <vector56>:
.globl vector56
vector56:
  pushl $0
  101de8:	6a 00                	push   $0x0
  pushl $56
  101dea:	6a 38                	push   $0x38
  jmp __alltraps
  101dec:	e9 7f 08 00 00       	jmp    102670 <__alltraps>

00101df1 <vector57>:
.globl vector57
vector57:
  pushl $0
  101df1:	6a 00                	push   $0x0
  pushl $57
  101df3:	6a 39                	push   $0x39
  jmp __alltraps
  101df5:	e9 76 08 00 00       	jmp    102670 <__alltraps>

00101dfa <vector58>:
.globl vector58
vector58:
  pushl $0
  101dfa:	6a 00                	push   $0x0
  pushl $58
  101dfc:	6a 3a                	push   $0x3a
  jmp __alltraps
  101dfe:	e9 6d 08 00 00       	jmp    102670 <__alltraps>

00101e03 <vector59>:
.globl vector59
vector59:
  pushl $0
  101e03:	6a 00                	push   $0x0
  pushl $59
  101e05:	6a 3b                	push   $0x3b
  jmp __alltraps
  101e07:	e9 64 08 00 00       	jmp    102670 <__alltraps>

00101e0c <vector60>:
.globl vector60
vector60:
  pushl $0
  101e0c:	6a 00                	push   $0x0
  pushl $60
  101e0e:	6a 3c                	push   $0x3c
  jmp __alltraps
  101e10:	e9 5b 08 00 00       	jmp    102670 <__alltraps>

00101e15 <vector61>:
.globl vector61
vector61:
  pushl $0
  101e15:	6a 00                	push   $0x0
  pushl $61
  101e17:	6a 3d                	push   $0x3d
  jmp __alltraps
  101e19:	e9 52 08 00 00       	jmp    102670 <__alltraps>

00101e1e <vector62>:
.globl vector62
vector62:
  pushl $0
  101e1e:	6a 00                	push   $0x0
  pushl $62
  101e20:	6a 3e                	push   $0x3e
  jmp __alltraps
  101e22:	e9 49 08 00 00       	jmp    102670 <__alltraps>

00101e27 <vector63>:
.globl vector63
vector63:
  pushl $0
  101e27:	6a 00                	push   $0x0
  pushl $63
  101e29:	6a 3f                	push   $0x3f
  jmp __alltraps
  101e2b:	e9 40 08 00 00       	jmp    102670 <__alltraps>

00101e30 <vector64>:
.globl vector64
vector64:
  pushl $0
  101e30:	6a 00                	push   $0x0
  pushl $64
  101e32:	6a 40                	push   $0x40
  jmp __alltraps
  101e34:	e9 37 08 00 00       	jmp    102670 <__alltraps>

00101e39 <vector65>:
.globl vector65
vector65:
  pushl $0
  101e39:	6a 00                	push   $0x0
  pushl $65
  101e3b:	6a 41                	push   $0x41
  jmp __alltraps
  101e3d:	e9 2e 08 00 00       	jmp    102670 <__alltraps>

00101e42 <vector66>:
.globl vector66
vector66:
  pushl $0
  101e42:	6a 00                	push   $0x0
  pushl $66
  101e44:	6a 42                	push   $0x42
  jmp __alltraps
  101e46:	e9 25 08 00 00       	jmp    102670 <__alltraps>

00101e4b <vector67>:
.globl vector67
vector67:
  pushl $0
  101e4b:	6a 00                	push   $0x0
  pushl $67
  101e4d:	6a 43                	push   $0x43
  jmp __alltraps
  101e4f:	e9 1c 08 00 00       	jmp    102670 <__alltraps>

00101e54 <vector68>:
.globl vector68
vector68:
  pushl $0
  101e54:	6a 00                	push   $0x0
  pushl $68
  101e56:	6a 44                	push   $0x44
  jmp __alltraps
  101e58:	e9 13 08 00 00       	jmp    102670 <__alltraps>

00101e5d <vector69>:
.globl vector69
vector69:
  pushl $0
  101e5d:	6a 00                	push   $0x0
  pushl $69
  101e5f:	6a 45                	push   $0x45
  jmp __alltraps
  101e61:	e9 0a 08 00 00       	jmp    102670 <__alltraps>

00101e66 <vector70>:
.globl vector70
vector70:
  pushl $0
  101e66:	6a 00                	push   $0x0
  pushl $70
  101e68:	6a 46                	push   $0x46
  jmp __alltraps
  101e6a:	e9 01 08 00 00       	jmp    102670 <__alltraps>

00101e6f <vector71>:
.globl vector71
vector71:
  pushl $0
  101e6f:	6a 00                	push   $0x0
  pushl $71
  101e71:	6a 47                	push   $0x47
  jmp __alltraps
  101e73:	e9 f8 07 00 00       	jmp    102670 <__alltraps>

00101e78 <vector72>:
.globl vector72
vector72:
  pushl $0
  101e78:	6a 00                	push   $0x0
  pushl $72
  101e7a:	6a 48                	push   $0x48
  jmp __alltraps
  101e7c:	e9 ef 07 00 00       	jmp    102670 <__alltraps>

00101e81 <vector73>:
.globl vector73
vector73:
  pushl $0
  101e81:	6a 00                	push   $0x0
  pushl $73
  101e83:	6a 49                	push   $0x49
  jmp __alltraps
  101e85:	e9 e6 07 00 00       	jmp    102670 <__alltraps>

00101e8a <vector74>:
.globl vector74
vector74:
  pushl $0
  101e8a:	6a 00                	push   $0x0
  pushl $74
  101e8c:	6a 4a                	push   $0x4a
  jmp __alltraps
  101e8e:	e9 dd 07 00 00       	jmp    102670 <__alltraps>

00101e93 <vector75>:
.globl vector75
vector75:
  pushl $0
  101e93:	6a 00                	push   $0x0
  pushl $75
  101e95:	6a 4b                	push   $0x4b
  jmp __alltraps
  101e97:	e9 d4 07 00 00       	jmp    102670 <__alltraps>

00101e9c <vector76>:
.globl vector76
vector76:
  pushl $0
  101e9c:	6a 00                	push   $0x0
  pushl $76
  101e9e:	6a 4c                	push   $0x4c
  jmp __alltraps
  101ea0:	e9 cb 07 00 00       	jmp    102670 <__alltraps>

00101ea5 <vector77>:
.globl vector77
vector77:
  pushl $0
  101ea5:	6a 00                	push   $0x0
  pushl $77
  101ea7:	6a 4d                	push   $0x4d
  jmp __alltraps
  101ea9:	e9 c2 07 00 00       	jmp    102670 <__alltraps>

00101eae <vector78>:
.globl vector78
vector78:
  pushl $0
  101eae:	6a 00                	push   $0x0
  pushl $78
  101eb0:	6a 4e                	push   $0x4e
  jmp __alltraps
  101eb2:	e9 b9 07 00 00       	jmp    102670 <__alltraps>

00101eb7 <vector79>:
.globl vector79
vector79:
  pushl $0
  101eb7:	6a 00                	push   $0x0
  pushl $79
  101eb9:	6a 4f                	push   $0x4f
  jmp __alltraps
  101ebb:	e9 b0 07 00 00       	jmp    102670 <__alltraps>

00101ec0 <vector80>:
.globl vector80
vector80:
  pushl $0
  101ec0:	6a 00                	push   $0x0
  pushl $80
  101ec2:	6a 50                	push   $0x50
  jmp __alltraps
  101ec4:	e9 a7 07 00 00       	jmp    102670 <__alltraps>

00101ec9 <vector81>:
.globl vector81
vector81:
  pushl $0
  101ec9:	6a 00                	push   $0x0
  pushl $81
  101ecb:	6a 51                	push   $0x51
  jmp __alltraps
  101ecd:	e9 9e 07 00 00       	jmp    102670 <__alltraps>

00101ed2 <vector82>:
.globl vector82
vector82:
  pushl $0
  101ed2:	6a 00                	push   $0x0
  pushl $82
  101ed4:	6a 52                	push   $0x52
  jmp __alltraps
  101ed6:	e9 95 07 00 00       	jmp    102670 <__alltraps>

00101edb <vector83>:
.globl vector83
vector83:
  pushl $0
  101edb:	6a 00                	push   $0x0
  pushl $83
  101edd:	6a 53                	push   $0x53
  jmp __alltraps
  101edf:	e9 8c 07 00 00       	jmp    102670 <__alltraps>

00101ee4 <vector84>:
.globl vector84
vector84:
  pushl $0
  101ee4:	6a 00                	push   $0x0
  pushl $84
  101ee6:	6a 54                	push   $0x54
  jmp __alltraps
  101ee8:	e9 83 07 00 00       	jmp    102670 <__alltraps>

00101eed <vector85>:
.globl vector85
vector85:
  pushl $0
  101eed:	6a 00                	push   $0x0
  pushl $85
  101eef:	6a 55                	push   $0x55
  jmp __alltraps
  101ef1:	e9 7a 07 00 00       	jmp    102670 <__alltraps>

00101ef6 <vector86>:
.globl vector86
vector86:
  pushl $0
  101ef6:	6a 00                	push   $0x0
  pushl $86
  101ef8:	6a 56                	push   $0x56
  jmp __alltraps
  101efa:	e9 71 07 00 00       	jmp    102670 <__alltraps>

00101eff <vector87>:
.globl vector87
vector87:
  pushl $0
  101eff:	6a 00                	push   $0x0
  pushl $87
  101f01:	6a 57                	push   $0x57
  jmp __alltraps
  101f03:	e9 68 07 00 00       	jmp    102670 <__alltraps>

00101f08 <vector88>:
.globl vector88
vector88:
  pushl $0
  101f08:	6a 00                	push   $0x0
  pushl $88
  101f0a:	6a 58                	push   $0x58
  jmp __alltraps
  101f0c:	e9 5f 07 00 00       	jmp    102670 <__alltraps>

00101f11 <vector89>:
.globl vector89
vector89:
  pushl $0
  101f11:	6a 00                	push   $0x0
  pushl $89
  101f13:	6a 59                	push   $0x59
  jmp __alltraps
  101f15:	e9 56 07 00 00       	jmp    102670 <__alltraps>

00101f1a <vector90>:
.globl vector90
vector90:
  pushl $0
  101f1a:	6a 00                	push   $0x0
  pushl $90
  101f1c:	6a 5a                	push   $0x5a
  jmp __alltraps
  101f1e:	e9 4d 07 00 00       	jmp    102670 <__alltraps>

00101f23 <vector91>:
.globl vector91
vector91:
  pushl $0
  101f23:	6a 00                	push   $0x0
  pushl $91
  101f25:	6a 5b                	push   $0x5b
  jmp __alltraps
  101f27:	e9 44 07 00 00       	jmp    102670 <__alltraps>

00101f2c <vector92>:
.globl vector92
vector92:
  pushl $0
  101f2c:	6a 00                	push   $0x0
  pushl $92
  101f2e:	6a 5c                	push   $0x5c
  jmp __alltraps
  101f30:	e9 3b 07 00 00       	jmp    102670 <__alltraps>

00101f35 <vector93>:
.globl vector93
vector93:
  pushl $0
  101f35:	6a 00                	push   $0x0
  pushl $93
  101f37:	6a 5d                	push   $0x5d
  jmp __alltraps
  101f39:	e9 32 07 00 00       	jmp    102670 <__alltraps>

00101f3e <vector94>:
.globl vector94
vector94:
  pushl $0
  101f3e:	6a 00                	push   $0x0
  pushl $94
  101f40:	6a 5e                	push   $0x5e
  jmp __alltraps
  101f42:	e9 29 07 00 00       	jmp    102670 <__alltraps>

00101f47 <vector95>:
.globl vector95
vector95:
  pushl $0
  101f47:	6a 00                	push   $0x0
  pushl $95
  101f49:	6a 5f                	push   $0x5f
  jmp __alltraps
  101f4b:	e9 20 07 00 00       	jmp    102670 <__alltraps>

00101f50 <vector96>:
.globl vector96
vector96:
  pushl $0
  101f50:	6a 00                	push   $0x0
  pushl $96
  101f52:	6a 60                	push   $0x60
  jmp __alltraps
  101f54:	e9 17 07 00 00       	jmp    102670 <__alltraps>

00101f59 <vector97>:
.globl vector97
vector97:
  pushl $0
  101f59:	6a 00                	push   $0x0
  pushl $97
  101f5b:	6a 61                	push   $0x61
  jmp __alltraps
  101f5d:	e9 0e 07 00 00       	jmp    102670 <__alltraps>

00101f62 <vector98>:
.globl vector98
vector98:
  pushl $0
  101f62:	6a 00                	push   $0x0
  pushl $98
  101f64:	6a 62                	push   $0x62
  jmp __alltraps
  101f66:	e9 05 07 00 00       	jmp    102670 <__alltraps>

00101f6b <vector99>:
.globl vector99
vector99:
  pushl $0
  101f6b:	6a 00                	push   $0x0
  pushl $99
  101f6d:	6a 63                	push   $0x63
  jmp __alltraps
  101f6f:	e9 fc 06 00 00       	jmp    102670 <__alltraps>

00101f74 <vector100>:
.globl vector100
vector100:
  pushl $0
  101f74:	6a 00                	push   $0x0
  pushl $100
  101f76:	6a 64                	push   $0x64
  jmp __alltraps
  101f78:	e9 f3 06 00 00       	jmp    102670 <__alltraps>

00101f7d <vector101>:
.globl vector101
vector101:
  pushl $0
  101f7d:	6a 00                	push   $0x0
  pushl $101
  101f7f:	6a 65                	push   $0x65
  jmp __alltraps
  101f81:	e9 ea 06 00 00       	jmp    102670 <__alltraps>

00101f86 <vector102>:
.globl vector102
vector102:
  pushl $0
  101f86:	6a 00                	push   $0x0
  pushl $102
  101f88:	6a 66                	push   $0x66
  jmp __alltraps
  101f8a:	e9 e1 06 00 00       	jmp    102670 <__alltraps>

00101f8f <vector103>:
.globl vector103
vector103:
  pushl $0
  101f8f:	6a 00                	push   $0x0
  pushl $103
  101f91:	6a 67                	push   $0x67
  jmp __alltraps
  101f93:	e9 d8 06 00 00       	jmp    102670 <__alltraps>

00101f98 <vector104>:
.globl vector104
vector104:
  pushl $0
  101f98:	6a 00                	push   $0x0
  pushl $104
  101f9a:	6a 68                	push   $0x68
  jmp __alltraps
  101f9c:	e9 cf 06 00 00       	jmp    102670 <__alltraps>

00101fa1 <vector105>:
.globl vector105
vector105:
  pushl $0
  101fa1:	6a 00                	push   $0x0
  pushl $105
  101fa3:	6a 69                	push   $0x69
  jmp __alltraps
  101fa5:	e9 c6 06 00 00       	jmp    102670 <__alltraps>

00101faa <vector106>:
.globl vector106
vector106:
  pushl $0
  101faa:	6a 00                	push   $0x0
  pushl $106
  101fac:	6a 6a                	push   $0x6a
  jmp __alltraps
  101fae:	e9 bd 06 00 00       	jmp    102670 <__alltraps>

00101fb3 <vector107>:
.globl vector107
vector107:
  pushl $0
  101fb3:	6a 00                	push   $0x0
  pushl $107
  101fb5:	6a 6b                	push   $0x6b
  jmp __alltraps
  101fb7:	e9 b4 06 00 00       	jmp    102670 <__alltraps>

00101fbc <vector108>:
.globl vector108
vector108:
  pushl $0
  101fbc:	6a 00                	push   $0x0
  pushl $108
  101fbe:	6a 6c                	push   $0x6c
  jmp __alltraps
  101fc0:	e9 ab 06 00 00       	jmp    102670 <__alltraps>

00101fc5 <vector109>:
.globl vector109
vector109:
  pushl $0
  101fc5:	6a 00                	push   $0x0
  pushl $109
  101fc7:	6a 6d                	push   $0x6d
  jmp __alltraps
  101fc9:	e9 a2 06 00 00       	jmp    102670 <__alltraps>

00101fce <vector110>:
.globl vector110
vector110:
  pushl $0
  101fce:	6a 00                	push   $0x0
  pushl $110
  101fd0:	6a 6e                	push   $0x6e
  jmp __alltraps
  101fd2:	e9 99 06 00 00       	jmp    102670 <__alltraps>

00101fd7 <vector111>:
.globl vector111
vector111:
  pushl $0
  101fd7:	6a 00                	push   $0x0
  pushl $111
  101fd9:	6a 6f                	push   $0x6f
  jmp __alltraps
  101fdb:	e9 90 06 00 00       	jmp    102670 <__alltraps>

00101fe0 <vector112>:
.globl vector112
vector112:
  pushl $0
  101fe0:	6a 00                	push   $0x0
  pushl $112
  101fe2:	6a 70                	push   $0x70
  jmp __alltraps
  101fe4:	e9 87 06 00 00       	jmp    102670 <__alltraps>

00101fe9 <vector113>:
.globl vector113
vector113:
  pushl $0
  101fe9:	6a 00                	push   $0x0
  pushl $113
  101feb:	6a 71                	push   $0x71
  jmp __alltraps
  101fed:	e9 7e 06 00 00       	jmp    102670 <__alltraps>

00101ff2 <vector114>:
.globl vector114
vector114:
  pushl $0
  101ff2:	6a 00                	push   $0x0
  pushl $114
  101ff4:	6a 72                	push   $0x72
  jmp __alltraps
  101ff6:	e9 75 06 00 00       	jmp    102670 <__alltraps>

00101ffb <vector115>:
.globl vector115
vector115:
  pushl $0
  101ffb:	6a 00                	push   $0x0
  pushl $115
  101ffd:	6a 73                	push   $0x73
  jmp __alltraps
  101fff:	e9 6c 06 00 00       	jmp    102670 <__alltraps>

00102004 <vector116>:
.globl vector116
vector116:
  pushl $0
  102004:	6a 00                	push   $0x0
  pushl $116
  102006:	6a 74                	push   $0x74
  jmp __alltraps
  102008:	e9 63 06 00 00       	jmp    102670 <__alltraps>

0010200d <vector117>:
.globl vector117
vector117:
  pushl $0
  10200d:	6a 00                	push   $0x0
  pushl $117
  10200f:	6a 75                	push   $0x75
  jmp __alltraps
  102011:	e9 5a 06 00 00       	jmp    102670 <__alltraps>

00102016 <vector118>:
.globl vector118
vector118:
  pushl $0
  102016:	6a 00                	push   $0x0
  pushl $118
  102018:	6a 76                	push   $0x76
  jmp __alltraps
  10201a:	e9 51 06 00 00       	jmp    102670 <__alltraps>

0010201f <vector119>:
.globl vector119
vector119:
  pushl $0
  10201f:	6a 00                	push   $0x0
  pushl $119
  102021:	6a 77                	push   $0x77
  jmp __alltraps
  102023:	e9 48 06 00 00       	jmp    102670 <__alltraps>

00102028 <vector120>:
.globl vector120
vector120:
  pushl $0
  102028:	6a 00                	push   $0x0
  pushl $120
  10202a:	6a 78                	push   $0x78
  jmp __alltraps
  10202c:	e9 3f 06 00 00       	jmp    102670 <__alltraps>

00102031 <vector121>:
.globl vector121
vector121:
  pushl $0
  102031:	6a 00                	push   $0x0
  pushl $121
  102033:	6a 79                	push   $0x79
  jmp __alltraps
  102035:	e9 36 06 00 00       	jmp    102670 <__alltraps>

0010203a <vector122>:
.globl vector122
vector122:
  pushl $0
  10203a:	6a 00                	push   $0x0
  pushl $122
  10203c:	6a 7a                	push   $0x7a
  jmp __alltraps
  10203e:	e9 2d 06 00 00       	jmp    102670 <__alltraps>

00102043 <vector123>:
.globl vector123
vector123:
  pushl $0
  102043:	6a 00                	push   $0x0
  pushl $123
  102045:	6a 7b                	push   $0x7b
  jmp __alltraps
  102047:	e9 24 06 00 00       	jmp    102670 <__alltraps>

0010204c <vector124>:
.globl vector124
vector124:
  pushl $0
  10204c:	6a 00                	push   $0x0
  pushl $124
  10204e:	6a 7c                	push   $0x7c
  jmp __alltraps
  102050:	e9 1b 06 00 00       	jmp    102670 <__alltraps>

00102055 <vector125>:
.globl vector125
vector125:
  pushl $0
  102055:	6a 00                	push   $0x0
  pushl $125
  102057:	6a 7d                	push   $0x7d
  jmp __alltraps
  102059:	e9 12 06 00 00       	jmp    102670 <__alltraps>

0010205e <vector126>:
.globl vector126
vector126:
  pushl $0
  10205e:	6a 00                	push   $0x0
  pushl $126
  102060:	6a 7e                	push   $0x7e
  jmp __alltraps
  102062:	e9 09 06 00 00       	jmp    102670 <__alltraps>

00102067 <vector127>:
.globl vector127
vector127:
  pushl $0
  102067:	6a 00                	push   $0x0
  pushl $127
  102069:	6a 7f                	push   $0x7f
  jmp __alltraps
  10206b:	e9 00 06 00 00       	jmp    102670 <__alltraps>

00102070 <vector128>:
.globl vector128
vector128:
  pushl $0
  102070:	6a 00                	push   $0x0
  pushl $128
  102072:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  102077:	e9 f4 05 00 00       	jmp    102670 <__alltraps>

0010207c <vector129>:
.globl vector129
vector129:
  pushl $0
  10207c:	6a 00                	push   $0x0
  pushl $129
  10207e:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  102083:	e9 e8 05 00 00       	jmp    102670 <__alltraps>

00102088 <vector130>:
.globl vector130
vector130:
  pushl $0
  102088:	6a 00                	push   $0x0
  pushl $130
  10208a:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  10208f:	e9 dc 05 00 00       	jmp    102670 <__alltraps>

00102094 <vector131>:
.globl vector131
vector131:
  pushl $0
  102094:	6a 00                	push   $0x0
  pushl $131
  102096:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10209b:	e9 d0 05 00 00       	jmp    102670 <__alltraps>

001020a0 <vector132>:
.globl vector132
vector132:
  pushl $0
  1020a0:	6a 00                	push   $0x0
  pushl $132
  1020a2:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1020a7:	e9 c4 05 00 00       	jmp    102670 <__alltraps>

001020ac <vector133>:
.globl vector133
vector133:
  pushl $0
  1020ac:	6a 00                	push   $0x0
  pushl $133
  1020ae:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1020b3:	e9 b8 05 00 00       	jmp    102670 <__alltraps>

001020b8 <vector134>:
.globl vector134
vector134:
  pushl $0
  1020b8:	6a 00                	push   $0x0
  pushl $134
  1020ba:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1020bf:	e9 ac 05 00 00       	jmp    102670 <__alltraps>

001020c4 <vector135>:
.globl vector135
vector135:
  pushl $0
  1020c4:	6a 00                	push   $0x0
  pushl $135
  1020c6:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1020cb:	e9 a0 05 00 00       	jmp    102670 <__alltraps>

001020d0 <vector136>:
.globl vector136
vector136:
  pushl $0
  1020d0:	6a 00                	push   $0x0
  pushl $136
  1020d2:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  1020d7:	e9 94 05 00 00       	jmp    102670 <__alltraps>

001020dc <vector137>:
.globl vector137
vector137:
  pushl $0
  1020dc:	6a 00                	push   $0x0
  pushl $137
  1020de:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  1020e3:	e9 88 05 00 00       	jmp    102670 <__alltraps>

001020e8 <vector138>:
.globl vector138
vector138:
  pushl $0
  1020e8:	6a 00                	push   $0x0
  pushl $138
  1020ea:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  1020ef:	e9 7c 05 00 00       	jmp    102670 <__alltraps>

001020f4 <vector139>:
.globl vector139
vector139:
  pushl $0
  1020f4:	6a 00                	push   $0x0
  pushl $139
  1020f6:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  1020fb:	e9 70 05 00 00       	jmp    102670 <__alltraps>

00102100 <vector140>:
.globl vector140
vector140:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $140
  102102:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102107:	e9 64 05 00 00       	jmp    102670 <__alltraps>

0010210c <vector141>:
.globl vector141
vector141:
  pushl $0
  10210c:	6a 00                	push   $0x0
  pushl $141
  10210e:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102113:	e9 58 05 00 00       	jmp    102670 <__alltraps>

00102118 <vector142>:
.globl vector142
vector142:
  pushl $0
  102118:	6a 00                	push   $0x0
  pushl $142
  10211a:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10211f:	e9 4c 05 00 00       	jmp    102670 <__alltraps>

00102124 <vector143>:
.globl vector143
vector143:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $143
  102126:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  10212b:	e9 40 05 00 00       	jmp    102670 <__alltraps>

00102130 <vector144>:
.globl vector144
vector144:
  pushl $0
  102130:	6a 00                	push   $0x0
  pushl $144
  102132:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102137:	e9 34 05 00 00       	jmp    102670 <__alltraps>

0010213c <vector145>:
.globl vector145
vector145:
  pushl $0
  10213c:	6a 00                	push   $0x0
  pushl $145
  10213e:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102143:	e9 28 05 00 00       	jmp    102670 <__alltraps>

00102148 <vector146>:
.globl vector146
vector146:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $146
  10214a:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10214f:	e9 1c 05 00 00       	jmp    102670 <__alltraps>

00102154 <vector147>:
.globl vector147
vector147:
  pushl $0
  102154:	6a 00                	push   $0x0
  pushl $147
  102156:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  10215b:	e9 10 05 00 00       	jmp    102670 <__alltraps>

00102160 <vector148>:
.globl vector148
vector148:
  pushl $0
  102160:	6a 00                	push   $0x0
  pushl $148
  102162:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102167:	e9 04 05 00 00       	jmp    102670 <__alltraps>

0010216c <vector149>:
.globl vector149
vector149:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $149
  10216e:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  102173:	e9 f8 04 00 00       	jmp    102670 <__alltraps>

00102178 <vector150>:
.globl vector150
vector150:
  pushl $0
  102178:	6a 00                	push   $0x0
  pushl $150
  10217a:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  10217f:	e9 ec 04 00 00       	jmp    102670 <__alltraps>

00102184 <vector151>:
.globl vector151
vector151:
  pushl $0
  102184:	6a 00                	push   $0x0
  pushl $151
  102186:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  10218b:	e9 e0 04 00 00       	jmp    102670 <__alltraps>

00102190 <vector152>:
.globl vector152
vector152:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $152
  102192:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102197:	e9 d4 04 00 00       	jmp    102670 <__alltraps>

0010219c <vector153>:
.globl vector153
vector153:
  pushl $0
  10219c:	6a 00                	push   $0x0
  pushl $153
  10219e:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1021a3:	e9 c8 04 00 00       	jmp    102670 <__alltraps>

001021a8 <vector154>:
.globl vector154
vector154:
  pushl $0
  1021a8:	6a 00                	push   $0x0
  pushl $154
  1021aa:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1021af:	e9 bc 04 00 00       	jmp    102670 <__alltraps>

001021b4 <vector155>:
.globl vector155
vector155:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $155
  1021b6:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1021bb:	e9 b0 04 00 00       	jmp    102670 <__alltraps>

001021c0 <vector156>:
.globl vector156
vector156:
  pushl $0
  1021c0:	6a 00                	push   $0x0
  pushl $156
  1021c2:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1021c7:	e9 a4 04 00 00       	jmp    102670 <__alltraps>

001021cc <vector157>:
.globl vector157
vector157:
  pushl $0
  1021cc:	6a 00                	push   $0x0
  pushl $157
  1021ce:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  1021d3:	e9 98 04 00 00       	jmp    102670 <__alltraps>

001021d8 <vector158>:
.globl vector158
vector158:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $158
  1021da:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  1021df:	e9 8c 04 00 00       	jmp    102670 <__alltraps>

001021e4 <vector159>:
.globl vector159
vector159:
  pushl $0
  1021e4:	6a 00                	push   $0x0
  pushl $159
  1021e6:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  1021eb:	e9 80 04 00 00       	jmp    102670 <__alltraps>

001021f0 <vector160>:
.globl vector160
vector160:
  pushl $0
  1021f0:	6a 00                	push   $0x0
  pushl $160
  1021f2:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  1021f7:	e9 74 04 00 00       	jmp    102670 <__alltraps>

001021fc <vector161>:
.globl vector161
vector161:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $161
  1021fe:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102203:	e9 68 04 00 00       	jmp    102670 <__alltraps>

00102208 <vector162>:
.globl vector162
vector162:
  pushl $0
  102208:	6a 00                	push   $0x0
  pushl $162
  10220a:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10220f:	e9 5c 04 00 00       	jmp    102670 <__alltraps>

00102214 <vector163>:
.globl vector163
vector163:
  pushl $0
  102214:	6a 00                	push   $0x0
  pushl $163
  102216:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  10221b:	e9 50 04 00 00       	jmp    102670 <__alltraps>

00102220 <vector164>:
.globl vector164
vector164:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $164
  102222:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102227:	e9 44 04 00 00       	jmp    102670 <__alltraps>

0010222c <vector165>:
.globl vector165
vector165:
  pushl $0
  10222c:	6a 00                	push   $0x0
  pushl $165
  10222e:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102233:	e9 38 04 00 00       	jmp    102670 <__alltraps>

00102238 <vector166>:
.globl vector166
vector166:
  pushl $0
  102238:	6a 00                	push   $0x0
  pushl $166
  10223a:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10223f:	e9 2c 04 00 00       	jmp    102670 <__alltraps>

00102244 <vector167>:
.globl vector167
vector167:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $167
  102246:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  10224b:	e9 20 04 00 00       	jmp    102670 <__alltraps>

00102250 <vector168>:
.globl vector168
vector168:
  pushl $0
  102250:	6a 00                	push   $0x0
  pushl $168
  102252:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102257:	e9 14 04 00 00       	jmp    102670 <__alltraps>

0010225c <vector169>:
.globl vector169
vector169:
  pushl $0
  10225c:	6a 00                	push   $0x0
  pushl $169
  10225e:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102263:	e9 08 04 00 00       	jmp    102670 <__alltraps>

00102268 <vector170>:
.globl vector170
vector170:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $170
  10226a:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10226f:	e9 fc 03 00 00       	jmp    102670 <__alltraps>

00102274 <vector171>:
.globl vector171
vector171:
  pushl $0
  102274:	6a 00                	push   $0x0
  pushl $171
  102276:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  10227b:	e9 f0 03 00 00       	jmp    102670 <__alltraps>

00102280 <vector172>:
.globl vector172
vector172:
  pushl $0
  102280:	6a 00                	push   $0x0
  pushl $172
  102282:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  102287:	e9 e4 03 00 00       	jmp    102670 <__alltraps>

0010228c <vector173>:
.globl vector173
vector173:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $173
  10228e:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102293:	e9 d8 03 00 00       	jmp    102670 <__alltraps>

00102298 <vector174>:
.globl vector174
vector174:
  pushl $0
  102298:	6a 00                	push   $0x0
  pushl $174
  10229a:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  10229f:	e9 cc 03 00 00       	jmp    102670 <__alltraps>

001022a4 <vector175>:
.globl vector175
vector175:
  pushl $0
  1022a4:	6a 00                	push   $0x0
  pushl $175
  1022a6:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1022ab:	e9 c0 03 00 00       	jmp    102670 <__alltraps>

001022b0 <vector176>:
.globl vector176
vector176:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $176
  1022b2:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1022b7:	e9 b4 03 00 00       	jmp    102670 <__alltraps>

001022bc <vector177>:
.globl vector177
vector177:
  pushl $0
  1022bc:	6a 00                	push   $0x0
  pushl $177
  1022be:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1022c3:	e9 a8 03 00 00       	jmp    102670 <__alltraps>

001022c8 <vector178>:
.globl vector178
vector178:
  pushl $0
  1022c8:	6a 00                	push   $0x0
  pushl $178
  1022ca:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1022cf:	e9 9c 03 00 00       	jmp    102670 <__alltraps>

001022d4 <vector179>:
.globl vector179
vector179:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $179
  1022d6:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  1022db:	e9 90 03 00 00       	jmp    102670 <__alltraps>

001022e0 <vector180>:
.globl vector180
vector180:
  pushl $0
  1022e0:	6a 00                	push   $0x0
  pushl $180
  1022e2:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  1022e7:	e9 84 03 00 00       	jmp    102670 <__alltraps>

001022ec <vector181>:
.globl vector181
vector181:
  pushl $0
  1022ec:	6a 00                	push   $0x0
  pushl $181
  1022ee:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  1022f3:	e9 78 03 00 00       	jmp    102670 <__alltraps>

001022f8 <vector182>:
.globl vector182
vector182:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $182
  1022fa:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  1022ff:	e9 6c 03 00 00       	jmp    102670 <__alltraps>

00102304 <vector183>:
.globl vector183
vector183:
  pushl $0
  102304:	6a 00                	push   $0x0
  pushl $183
  102306:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  10230b:	e9 60 03 00 00       	jmp    102670 <__alltraps>

00102310 <vector184>:
.globl vector184
vector184:
  pushl $0
  102310:	6a 00                	push   $0x0
  pushl $184
  102312:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102317:	e9 54 03 00 00       	jmp    102670 <__alltraps>

0010231c <vector185>:
.globl vector185
vector185:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $185
  10231e:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102323:	e9 48 03 00 00       	jmp    102670 <__alltraps>

00102328 <vector186>:
.globl vector186
vector186:
  pushl $0
  102328:	6a 00                	push   $0x0
  pushl $186
  10232a:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10232f:	e9 3c 03 00 00       	jmp    102670 <__alltraps>

00102334 <vector187>:
.globl vector187
vector187:
  pushl $0
  102334:	6a 00                	push   $0x0
  pushl $187
  102336:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  10233b:	e9 30 03 00 00       	jmp    102670 <__alltraps>

00102340 <vector188>:
.globl vector188
vector188:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $188
  102342:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102347:	e9 24 03 00 00       	jmp    102670 <__alltraps>

0010234c <vector189>:
.globl vector189
vector189:
  pushl $0
  10234c:	6a 00                	push   $0x0
  pushl $189
  10234e:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102353:	e9 18 03 00 00       	jmp    102670 <__alltraps>

00102358 <vector190>:
.globl vector190
vector190:
  pushl $0
  102358:	6a 00                	push   $0x0
  pushl $190
  10235a:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10235f:	e9 0c 03 00 00       	jmp    102670 <__alltraps>

00102364 <vector191>:
.globl vector191
vector191:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $191
  102366:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  10236b:	e9 00 03 00 00       	jmp    102670 <__alltraps>

00102370 <vector192>:
.globl vector192
vector192:
  pushl $0
  102370:	6a 00                	push   $0x0
  pushl $192
  102372:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  102377:	e9 f4 02 00 00       	jmp    102670 <__alltraps>

0010237c <vector193>:
.globl vector193
vector193:
  pushl $0
  10237c:	6a 00                	push   $0x0
  pushl $193
  10237e:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  102383:	e9 e8 02 00 00       	jmp    102670 <__alltraps>

00102388 <vector194>:
.globl vector194
vector194:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $194
  10238a:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  10238f:	e9 dc 02 00 00       	jmp    102670 <__alltraps>

00102394 <vector195>:
.globl vector195
vector195:
  pushl $0
  102394:	6a 00                	push   $0x0
  pushl $195
  102396:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10239b:	e9 d0 02 00 00       	jmp    102670 <__alltraps>

001023a0 <vector196>:
.globl vector196
vector196:
  pushl $0
  1023a0:	6a 00                	push   $0x0
  pushl $196
  1023a2:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1023a7:	e9 c4 02 00 00       	jmp    102670 <__alltraps>

001023ac <vector197>:
.globl vector197
vector197:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $197
  1023ae:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1023b3:	e9 b8 02 00 00       	jmp    102670 <__alltraps>

001023b8 <vector198>:
.globl vector198
vector198:
  pushl $0
  1023b8:	6a 00                	push   $0x0
  pushl $198
  1023ba:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1023bf:	e9 ac 02 00 00       	jmp    102670 <__alltraps>

001023c4 <vector199>:
.globl vector199
vector199:
  pushl $0
  1023c4:	6a 00                	push   $0x0
  pushl $199
  1023c6:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1023cb:	e9 a0 02 00 00       	jmp    102670 <__alltraps>

001023d0 <vector200>:
.globl vector200
vector200:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $200
  1023d2:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  1023d7:	e9 94 02 00 00       	jmp    102670 <__alltraps>

001023dc <vector201>:
.globl vector201
vector201:
  pushl $0
  1023dc:	6a 00                	push   $0x0
  pushl $201
  1023de:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  1023e3:	e9 88 02 00 00       	jmp    102670 <__alltraps>

001023e8 <vector202>:
.globl vector202
vector202:
  pushl $0
  1023e8:	6a 00                	push   $0x0
  pushl $202
  1023ea:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  1023ef:	e9 7c 02 00 00       	jmp    102670 <__alltraps>

001023f4 <vector203>:
.globl vector203
vector203:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $203
  1023f6:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  1023fb:	e9 70 02 00 00       	jmp    102670 <__alltraps>

00102400 <vector204>:
.globl vector204
vector204:
  pushl $0
  102400:	6a 00                	push   $0x0
  pushl $204
  102402:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102407:	e9 64 02 00 00       	jmp    102670 <__alltraps>

0010240c <vector205>:
.globl vector205
vector205:
  pushl $0
  10240c:	6a 00                	push   $0x0
  pushl $205
  10240e:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102413:	e9 58 02 00 00       	jmp    102670 <__alltraps>

00102418 <vector206>:
.globl vector206
vector206:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $206
  10241a:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10241f:	e9 4c 02 00 00       	jmp    102670 <__alltraps>

00102424 <vector207>:
.globl vector207
vector207:
  pushl $0
  102424:	6a 00                	push   $0x0
  pushl $207
  102426:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  10242b:	e9 40 02 00 00       	jmp    102670 <__alltraps>

00102430 <vector208>:
.globl vector208
vector208:
  pushl $0
  102430:	6a 00                	push   $0x0
  pushl $208
  102432:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102437:	e9 34 02 00 00       	jmp    102670 <__alltraps>

0010243c <vector209>:
.globl vector209
vector209:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $209
  10243e:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102443:	e9 28 02 00 00       	jmp    102670 <__alltraps>

00102448 <vector210>:
.globl vector210
vector210:
  pushl $0
  102448:	6a 00                	push   $0x0
  pushl $210
  10244a:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10244f:	e9 1c 02 00 00       	jmp    102670 <__alltraps>

00102454 <vector211>:
.globl vector211
vector211:
  pushl $0
  102454:	6a 00                	push   $0x0
  pushl $211
  102456:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  10245b:	e9 10 02 00 00       	jmp    102670 <__alltraps>

00102460 <vector212>:
.globl vector212
vector212:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $212
  102462:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102467:	e9 04 02 00 00       	jmp    102670 <__alltraps>

0010246c <vector213>:
.globl vector213
vector213:
  pushl $0
  10246c:	6a 00                	push   $0x0
  pushl $213
  10246e:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  102473:	e9 f8 01 00 00       	jmp    102670 <__alltraps>

00102478 <vector214>:
.globl vector214
vector214:
  pushl $0
  102478:	6a 00                	push   $0x0
  pushl $214
  10247a:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  10247f:	e9 ec 01 00 00       	jmp    102670 <__alltraps>

00102484 <vector215>:
.globl vector215
vector215:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $215
  102486:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  10248b:	e9 e0 01 00 00       	jmp    102670 <__alltraps>

00102490 <vector216>:
.globl vector216
vector216:
  pushl $0
  102490:	6a 00                	push   $0x0
  pushl $216
  102492:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102497:	e9 d4 01 00 00       	jmp    102670 <__alltraps>

0010249c <vector217>:
.globl vector217
vector217:
  pushl $0
  10249c:	6a 00                	push   $0x0
  pushl $217
  10249e:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1024a3:	e9 c8 01 00 00       	jmp    102670 <__alltraps>

001024a8 <vector218>:
.globl vector218
vector218:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $218
  1024aa:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1024af:	e9 bc 01 00 00       	jmp    102670 <__alltraps>

001024b4 <vector219>:
.globl vector219
vector219:
  pushl $0
  1024b4:	6a 00                	push   $0x0
  pushl $219
  1024b6:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1024bb:	e9 b0 01 00 00       	jmp    102670 <__alltraps>

001024c0 <vector220>:
.globl vector220
vector220:
  pushl $0
  1024c0:	6a 00                	push   $0x0
  pushl $220
  1024c2:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1024c7:	e9 a4 01 00 00       	jmp    102670 <__alltraps>

001024cc <vector221>:
.globl vector221
vector221:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $221
  1024ce:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  1024d3:	e9 98 01 00 00       	jmp    102670 <__alltraps>

001024d8 <vector222>:
.globl vector222
vector222:
  pushl $0
  1024d8:	6a 00                	push   $0x0
  pushl $222
  1024da:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  1024df:	e9 8c 01 00 00       	jmp    102670 <__alltraps>

001024e4 <vector223>:
.globl vector223
vector223:
  pushl $0
  1024e4:	6a 00                	push   $0x0
  pushl $223
  1024e6:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  1024eb:	e9 80 01 00 00       	jmp    102670 <__alltraps>

001024f0 <vector224>:
.globl vector224
vector224:
  pushl $0
  1024f0:	6a 00                	push   $0x0
  pushl $224
  1024f2:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  1024f7:	e9 74 01 00 00       	jmp    102670 <__alltraps>

001024fc <vector225>:
.globl vector225
vector225:
  pushl $0
  1024fc:	6a 00                	push   $0x0
  pushl $225
  1024fe:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102503:	e9 68 01 00 00       	jmp    102670 <__alltraps>

00102508 <vector226>:
.globl vector226
vector226:
  pushl $0
  102508:	6a 00                	push   $0x0
  pushl $226
  10250a:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10250f:	e9 5c 01 00 00       	jmp    102670 <__alltraps>

00102514 <vector227>:
.globl vector227
vector227:
  pushl $0
  102514:	6a 00                	push   $0x0
  pushl $227
  102516:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  10251b:	e9 50 01 00 00       	jmp    102670 <__alltraps>

00102520 <vector228>:
.globl vector228
vector228:
  pushl $0
  102520:	6a 00                	push   $0x0
  pushl $228
  102522:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102527:	e9 44 01 00 00       	jmp    102670 <__alltraps>

0010252c <vector229>:
.globl vector229
vector229:
  pushl $0
  10252c:	6a 00                	push   $0x0
  pushl $229
  10252e:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102533:	e9 38 01 00 00       	jmp    102670 <__alltraps>

00102538 <vector230>:
.globl vector230
vector230:
  pushl $0
  102538:	6a 00                	push   $0x0
  pushl $230
  10253a:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10253f:	e9 2c 01 00 00       	jmp    102670 <__alltraps>

00102544 <vector231>:
.globl vector231
vector231:
  pushl $0
  102544:	6a 00                	push   $0x0
  pushl $231
  102546:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  10254b:	e9 20 01 00 00       	jmp    102670 <__alltraps>

00102550 <vector232>:
.globl vector232
vector232:
  pushl $0
  102550:	6a 00                	push   $0x0
  pushl $232
  102552:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102557:	e9 14 01 00 00       	jmp    102670 <__alltraps>

0010255c <vector233>:
.globl vector233
vector233:
  pushl $0
  10255c:	6a 00                	push   $0x0
  pushl $233
  10255e:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102563:	e9 08 01 00 00       	jmp    102670 <__alltraps>

00102568 <vector234>:
.globl vector234
vector234:
  pushl $0
  102568:	6a 00                	push   $0x0
  pushl $234
  10256a:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10256f:	e9 fc 00 00 00       	jmp    102670 <__alltraps>

00102574 <vector235>:
.globl vector235
vector235:
  pushl $0
  102574:	6a 00                	push   $0x0
  pushl $235
  102576:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  10257b:	e9 f0 00 00 00       	jmp    102670 <__alltraps>

00102580 <vector236>:
.globl vector236
vector236:
  pushl $0
  102580:	6a 00                	push   $0x0
  pushl $236
  102582:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  102587:	e9 e4 00 00 00       	jmp    102670 <__alltraps>

0010258c <vector237>:
.globl vector237
vector237:
  pushl $0
  10258c:	6a 00                	push   $0x0
  pushl $237
  10258e:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102593:	e9 d8 00 00 00       	jmp    102670 <__alltraps>

00102598 <vector238>:
.globl vector238
vector238:
  pushl $0
  102598:	6a 00                	push   $0x0
  pushl $238
  10259a:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  10259f:	e9 cc 00 00 00       	jmp    102670 <__alltraps>

001025a4 <vector239>:
.globl vector239
vector239:
  pushl $0
  1025a4:	6a 00                	push   $0x0
  pushl $239
  1025a6:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1025ab:	e9 c0 00 00 00       	jmp    102670 <__alltraps>

001025b0 <vector240>:
.globl vector240
vector240:
  pushl $0
  1025b0:	6a 00                	push   $0x0
  pushl $240
  1025b2:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1025b7:	e9 b4 00 00 00       	jmp    102670 <__alltraps>

001025bc <vector241>:
.globl vector241
vector241:
  pushl $0
  1025bc:	6a 00                	push   $0x0
  pushl $241
  1025be:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1025c3:	e9 a8 00 00 00       	jmp    102670 <__alltraps>

001025c8 <vector242>:
.globl vector242
vector242:
  pushl $0
  1025c8:	6a 00                	push   $0x0
  pushl $242
  1025ca:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1025cf:	e9 9c 00 00 00       	jmp    102670 <__alltraps>

001025d4 <vector243>:
.globl vector243
vector243:
  pushl $0
  1025d4:	6a 00                	push   $0x0
  pushl $243
  1025d6:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  1025db:	e9 90 00 00 00       	jmp    102670 <__alltraps>

001025e0 <vector244>:
.globl vector244
vector244:
  pushl $0
  1025e0:	6a 00                	push   $0x0
  pushl $244
  1025e2:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  1025e7:	e9 84 00 00 00       	jmp    102670 <__alltraps>

001025ec <vector245>:
.globl vector245
vector245:
  pushl $0
  1025ec:	6a 00                	push   $0x0
  pushl $245
  1025ee:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  1025f3:	e9 78 00 00 00       	jmp    102670 <__alltraps>

001025f8 <vector246>:
.globl vector246
vector246:
  pushl $0
  1025f8:	6a 00                	push   $0x0
  pushl $246
  1025fa:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  1025ff:	e9 6c 00 00 00       	jmp    102670 <__alltraps>

00102604 <vector247>:
.globl vector247
vector247:
  pushl $0
  102604:	6a 00                	push   $0x0
  pushl $247
  102606:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  10260b:	e9 60 00 00 00       	jmp    102670 <__alltraps>

00102610 <vector248>:
.globl vector248
vector248:
  pushl $0
  102610:	6a 00                	push   $0x0
  pushl $248
  102612:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102617:	e9 54 00 00 00       	jmp    102670 <__alltraps>

0010261c <vector249>:
.globl vector249
vector249:
  pushl $0
  10261c:	6a 00                	push   $0x0
  pushl $249
  10261e:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102623:	e9 48 00 00 00       	jmp    102670 <__alltraps>

00102628 <vector250>:
.globl vector250
vector250:
  pushl $0
  102628:	6a 00                	push   $0x0
  pushl $250
  10262a:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10262f:	e9 3c 00 00 00       	jmp    102670 <__alltraps>

00102634 <vector251>:
.globl vector251
vector251:
  pushl $0
  102634:	6a 00                	push   $0x0
  pushl $251
  102636:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  10263b:	e9 30 00 00 00       	jmp    102670 <__alltraps>

00102640 <vector252>:
.globl vector252
vector252:
  pushl $0
  102640:	6a 00                	push   $0x0
  pushl $252
  102642:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102647:	e9 24 00 00 00       	jmp    102670 <__alltraps>

0010264c <vector253>:
.globl vector253
vector253:
  pushl $0
  10264c:	6a 00                	push   $0x0
  pushl $253
  10264e:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102653:	e9 18 00 00 00       	jmp    102670 <__alltraps>

00102658 <vector254>:
.globl vector254
vector254:
  pushl $0
  102658:	6a 00                	push   $0x0
  pushl $254
  10265a:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10265f:	e9 0c 00 00 00       	jmp    102670 <__alltraps>

00102664 <vector255>:
.globl vector255
vector255:
  pushl $0
  102664:	6a 00                	push   $0x0
  pushl $255
  102666:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  10266b:	e9 00 00 00 00       	jmp    102670 <__alltraps>

00102670 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102670:	1e                   	push   %ds
    pushl %es
  102671:	06                   	push   %es
    pushl %fs
  102672:	0f a0                	push   %fs
    pushl %gs
  102674:	0f a8                	push   %gs
    pushal
  102676:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102677:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  10267c:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  10267e:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102680:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102681:	e8 64 f5 ff ff       	call   101bea <trap>

    # pop the pushed stack pointer
    popl %esp
  102686:	5c                   	pop    %esp

00102687 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102687:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102688:	0f a9                	pop    %gs
    popl %fs
  10268a:	0f a1                	pop    %fs
    popl %es
  10268c:	07                   	pop    %es
    popl %ds
  10268d:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  10268e:	83 c4 08             	add    $0x8,%esp
    iret
  102691:	cf                   	iret   

00102692 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102692:	55                   	push   %ebp
  102693:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102695:	8b 45 08             	mov    0x8(%ebp),%eax
  102698:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  10269b:	b8 23 00 00 00       	mov    $0x23,%eax
  1026a0:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1026a2:	b8 23 00 00 00       	mov    $0x23,%eax
  1026a7:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1026a9:	b8 10 00 00 00       	mov    $0x10,%eax
  1026ae:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1026b0:	b8 10 00 00 00       	mov    $0x10,%eax
  1026b5:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1026b7:	b8 10 00 00 00       	mov    $0x10,%eax
  1026bc:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1026be:	ea c5 26 10 00 08 00 	ljmp   $0x8,$0x1026c5
}
  1026c5:	90                   	nop
  1026c6:	5d                   	pop    %ebp
  1026c7:	c3                   	ret    

001026c8 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1026c8:	55                   	push   %ebp
  1026c9:	89 e5                	mov    %esp,%ebp
  1026cb:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1026ce:	b8 20 09 11 00       	mov    $0x110920,%eax
  1026d3:	05 00 04 00 00       	add    $0x400,%eax
  1026d8:	a3 a4 08 11 00       	mov    %eax,0x1108a4
    ts.ts_ss0 = KERNEL_DS;
  1026dd:	66 c7 05 a8 08 11 00 	movw   $0x10,0x1108a8
  1026e4:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  1026e6:	66 c7 05 08 fa 10 00 	movw   $0x68,0x10fa08
  1026ed:	68 00 
  1026ef:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  1026f4:	0f b7 c0             	movzwl %ax,%eax
  1026f7:	66 a3 0a fa 10 00    	mov    %ax,0x10fa0a
  1026fd:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  102702:	c1 e8 10             	shr    $0x10,%eax
  102705:	a2 0c fa 10 00       	mov    %al,0x10fa0c
  10270a:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102711:	24 f0                	and    $0xf0,%al
  102713:	0c 09                	or     $0x9,%al
  102715:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  10271a:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  102721:	0c 10                	or     $0x10,%al
  102723:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102728:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10272f:	24 9f                	and    $0x9f,%al
  102731:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102736:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10273d:	0c 80                	or     $0x80,%al
  10273f:	a2 0d fa 10 00       	mov    %al,0x10fa0d
  102744:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  10274b:	24 f0                	and    $0xf0,%al
  10274d:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102752:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102759:	24 ef                	and    $0xef,%al
  10275b:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  102760:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102767:	24 df                	and    $0xdf,%al
  102769:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10276e:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102775:	0c 40                	or     $0x40,%al
  102777:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10277c:	0f b6 05 0e fa 10 00 	movzbl 0x10fa0e,%eax
  102783:	24 7f                	and    $0x7f,%al
  102785:	a2 0e fa 10 00       	mov    %al,0x10fa0e
  10278a:	b8 a0 08 11 00       	mov    $0x1108a0,%eax
  10278f:	c1 e8 18             	shr    $0x18,%eax
  102792:	a2 0f fa 10 00       	mov    %al,0x10fa0f
    gdt[SEG_TSS].sd_s = 0;
  102797:	0f b6 05 0d fa 10 00 	movzbl 0x10fa0d,%eax
  10279e:	24 ef                	and    $0xef,%al
  1027a0:	a2 0d fa 10 00       	mov    %al,0x10fa0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1027a5:	c7 04 24 10 fa 10 00 	movl   $0x10fa10,(%esp)
  1027ac:	e8 e1 fe ff ff       	call   102692 <lgdt>
  1027b1:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  1027b7:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  1027bb:	0f 00 d8             	ltr    %ax
}
  1027be:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  1027bf:	90                   	nop
  1027c0:	c9                   	leave  
  1027c1:	c3                   	ret    

001027c2 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  1027c2:	55                   	push   %ebp
  1027c3:	89 e5                	mov    %esp,%ebp
    gdt_init();
  1027c5:	e8 fe fe ff ff       	call   1026c8 <gdt_init>
}
  1027ca:	90                   	nop
  1027cb:	5d                   	pop    %ebp
  1027cc:	c3                   	ret    

001027cd <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  1027cd:	55                   	push   %ebp
  1027ce:	89 e5                	mov    %esp,%ebp
  1027d0:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1027d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  1027da:	eb 03                	jmp    1027df <strlen+0x12>
        cnt ++;
  1027dc:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  1027df:	8b 45 08             	mov    0x8(%ebp),%eax
  1027e2:	8d 50 01             	lea    0x1(%eax),%edx
  1027e5:	89 55 08             	mov    %edx,0x8(%ebp)
  1027e8:	0f b6 00             	movzbl (%eax),%eax
  1027eb:	84 c0                	test   %al,%al
  1027ed:	75 ed                	jne    1027dc <strlen+0xf>
    }
    return cnt;
  1027ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1027f2:	c9                   	leave  
  1027f3:	c3                   	ret    

001027f4 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  1027f4:	55                   	push   %ebp
  1027f5:	89 e5                	mov    %esp,%ebp
  1027f7:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  1027fa:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102801:	eb 03                	jmp    102806 <strnlen+0x12>
        cnt ++;
  102803:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102806:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102809:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10280c:	73 10                	jae    10281e <strnlen+0x2a>
  10280e:	8b 45 08             	mov    0x8(%ebp),%eax
  102811:	8d 50 01             	lea    0x1(%eax),%edx
  102814:	89 55 08             	mov    %edx,0x8(%ebp)
  102817:	0f b6 00             	movzbl (%eax),%eax
  10281a:	84 c0                	test   %al,%al
  10281c:	75 e5                	jne    102803 <strnlen+0xf>
    }
    return cnt;
  10281e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102821:	c9                   	leave  
  102822:	c3                   	ret    

00102823 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102823:	55                   	push   %ebp
  102824:	89 e5                	mov    %esp,%ebp
  102826:	57                   	push   %edi
  102827:	56                   	push   %esi
  102828:	83 ec 20             	sub    $0x20,%esp
  10282b:	8b 45 08             	mov    0x8(%ebp),%eax
  10282e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102831:	8b 45 0c             	mov    0xc(%ebp),%eax
  102834:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102837:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10283a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10283d:	89 d1                	mov    %edx,%ecx
  10283f:	89 c2                	mov    %eax,%edx
  102841:	89 ce                	mov    %ecx,%esi
  102843:	89 d7                	mov    %edx,%edi
  102845:	ac                   	lods   %ds:(%esi),%al
  102846:	aa                   	stos   %al,%es:(%edi)
  102847:	84 c0                	test   %al,%al
  102849:	75 fa                	jne    102845 <strcpy+0x22>
  10284b:	89 fa                	mov    %edi,%edx
  10284d:	89 f1                	mov    %esi,%ecx
  10284f:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102852:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102855:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102858:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  10285b:	83 c4 20             	add    $0x20,%esp
  10285e:	5e                   	pop    %esi
  10285f:	5f                   	pop    %edi
  102860:	5d                   	pop    %ebp
  102861:	c3                   	ret    

00102862 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102862:	55                   	push   %ebp
  102863:	89 e5                	mov    %esp,%ebp
  102865:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102868:	8b 45 08             	mov    0x8(%ebp),%eax
  10286b:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  10286e:	eb 1e                	jmp    10288e <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  102870:	8b 45 0c             	mov    0xc(%ebp),%eax
  102873:	0f b6 10             	movzbl (%eax),%edx
  102876:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102879:	88 10                	mov    %dl,(%eax)
  10287b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10287e:	0f b6 00             	movzbl (%eax),%eax
  102881:	84 c0                	test   %al,%al
  102883:	74 03                	je     102888 <strncpy+0x26>
            src ++;
  102885:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102888:	ff 45 fc             	incl   -0x4(%ebp)
  10288b:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  10288e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102892:	75 dc                	jne    102870 <strncpy+0xe>
    }
    return dst;
  102894:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102897:	c9                   	leave  
  102898:	c3                   	ret    

00102899 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102899:	55                   	push   %ebp
  10289a:	89 e5                	mov    %esp,%ebp
  10289c:	57                   	push   %edi
  10289d:	56                   	push   %esi
  10289e:	83 ec 20             	sub    $0x20,%esp
  1028a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1028a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1028a7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1028aa:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  1028ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1028b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1028b3:	89 d1                	mov    %edx,%ecx
  1028b5:	89 c2                	mov    %eax,%edx
  1028b7:	89 ce                	mov    %ecx,%esi
  1028b9:	89 d7                	mov    %edx,%edi
  1028bb:	ac                   	lods   %ds:(%esi),%al
  1028bc:	ae                   	scas   %es:(%edi),%al
  1028bd:	75 08                	jne    1028c7 <strcmp+0x2e>
  1028bf:	84 c0                	test   %al,%al
  1028c1:	75 f8                	jne    1028bb <strcmp+0x22>
  1028c3:	31 c0                	xor    %eax,%eax
  1028c5:	eb 04                	jmp    1028cb <strcmp+0x32>
  1028c7:	19 c0                	sbb    %eax,%eax
  1028c9:	0c 01                	or     $0x1,%al
  1028cb:	89 fa                	mov    %edi,%edx
  1028cd:	89 f1                	mov    %esi,%ecx
  1028cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1028d2:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1028d5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  1028d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1028db:	83 c4 20             	add    $0x20,%esp
  1028de:	5e                   	pop    %esi
  1028df:	5f                   	pop    %edi
  1028e0:	5d                   	pop    %ebp
  1028e1:	c3                   	ret    

001028e2 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1028e2:	55                   	push   %ebp
  1028e3:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1028e5:	eb 09                	jmp    1028f0 <strncmp+0xe>
        n --, s1 ++, s2 ++;
  1028e7:	ff 4d 10             	decl   0x10(%ebp)
  1028ea:	ff 45 08             	incl   0x8(%ebp)
  1028ed:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1028f0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1028f4:	74 1a                	je     102910 <strncmp+0x2e>
  1028f6:	8b 45 08             	mov    0x8(%ebp),%eax
  1028f9:	0f b6 00             	movzbl (%eax),%eax
  1028fc:	84 c0                	test   %al,%al
  1028fe:	74 10                	je     102910 <strncmp+0x2e>
  102900:	8b 45 08             	mov    0x8(%ebp),%eax
  102903:	0f b6 10             	movzbl (%eax),%edx
  102906:	8b 45 0c             	mov    0xc(%ebp),%eax
  102909:	0f b6 00             	movzbl (%eax),%eax
  10290c:	38 c2                	cmp    %al,%dl
  10290e:	74 d7                	je     1028e7 <strncmp+0x5>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102910:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102914:	74 18                	je     10292e <strncmp+0x4c>
  102916:	8b 45 08             	mov    0x8(%ebp),%eax
  102919:	0f b6 00             	movzbl (%eax),%eax
  10291c:	0f b6 d0             	movzbl %al,%edx
  10291f:	8b 45 0c             	mov    0xc(%ebp),%eax
  102922:	0f b6 00             	movzbl (%eax),%eax
  102925:	0f b6 c0             	movzbl %al,%eax
  102928:	29 c2                	sub    %eax,%edx
  10292a:	89 d0                	mov    %edx,%eax
  10292c:	eb 05                	jmp    102933 <strncmp+0x51>
  10292e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102933:	5d                   	pop    %ebp
  102934:	c3                   	ret    

00102935 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102935:	55                   	push   %ebp
  102936:	89 e5                	mov    %esp,%ebp
  102938:	83 ec 04             	sub    $0x4,%esp
  10293b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10293e:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102941:	eb 13                	jmp    102956 <strchr+0x21>
        if (*s == c) {
  102943:	8b 45 08             	mov    0x8(%ebp),%eax
  102946:	0f b6 00             	movzbl (%eax),%eax
  102949:	38 45 fc             	cmp    %al,-0x4(%ebp)
  10294c:	75 05                	jne    102953 <strchr+0x1e>
            return (char *)s;
  10294e:	8b 45 08             	mov    0x8(%ebp),%eax
  102951:	eb 12                	jmp    102965 <strchr+0x30>
        }
        s ++;
  102953:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102956:	8b 45 08             	mov    0x8(%ebp),%eax
  102959:	0f b6 00             	movzbl (%eax),%eax
  10295c:	84 c0                	test   %al,%al
  10295e:	75 e3                	jne    102943 <strchr+0xe>
    }
    return NULL;
  102960:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102965:	c9                   	leave  
  102966:	c3                   	ret    

00102967 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102967:	55                   	push   %ebp
  102968:	89 e5                	mov    %esp,%ebp
  10296a:	83 ec 04             	sub    $0x4,%esp
  10296d:	8b 45 0c             	mov    0xc(%ebp),%eax
  102970:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102973:	eb 0e                	jmp    102983 <strfind+0x1c>
        if (*s == c) {
  102975:	8b 45 08             	mov    0x8(%ebp),%eax
  102978:	0f b6 00             	movzbl (%eax),%eax
  10297b:	38 45 fc             	cmp    %al,-0x4(%ebp)
  10297e:	74 0f                	je     10298f <strfind+0x28>
            break;
        }
        s ++;
  102980:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102983:	8b 45 08             	mov    0x8(%ebp),%eax
  102986:	0f b6 00             	movzbl (%eax),%eax
  102989:	84 c0                	test   %al,%al
  10298b:	75 e8                	jne    102975 <strfind+0xe>
  10298d:	eb 01                	jmp    102990 <strfind+0x29>
            break;
  10298f:	90                   	nop
    }
    return (char *)s;
  102990:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102993:	c9                   	leave  
  102994:	c3                   	ret    

00102995 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102995:	55                   	push   %ebp
  102996:	89 e5                	mov    %esp,%ebp
  102998:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  10299b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  1029a2:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  1029a9:	eb 03                	jmp    1029ae <strtol+0x19>
        s ++;
  1029ab:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  1029ae:	8b 45 08             	mov    0x8(%ebp),%eax
  1029b1:	0f b6 00             	movzbl (%eax),%eax
  1029b4:	3c 20                	cmp    $0x20,%al
  1029b6:	74 f3                	je     1029ab <strtol+0x16>
  1029b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1029bb:	0f b6 00             	movzbl (%eax),%eax
  1029be:	3c 09                	cmp    $0x9,%al
  1029c0:	74 e9                	je     1029ab <strtol+0x16>
    }

    // plus/minus sign
    if (*s == '+') {
  1029c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1029c5:	0f b6 00             	movzbl (%eax),%eax
  1029c8:	3c 2b                	cmp    $0x2b,%al
  1029ca:	75 05                	jne    1029d1 <strtol+0x3c>
        s ++;
  1029cc:	ff 45 08             	incl   0x8(%ebp)
  1029cf:	eb 14                	jmp    1029e5 <strtol+0x50>
    }
    else if (*s == '-') {
  1029d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1029d4:	0f b6 00             	movzbl (%eax),%eax
  1029d7:	3c 2d                	cmp    $0x2d,%al
  1029d9:	75 0a                	jne    1029e5 <strtol+0x50>
        s ++, neg = 1;
  1029db:	ff 45 08             	incl   0x8(%ebp)
  1029de:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1029e5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1029e9:	74 06                	je     1029f1 <strtol+0x5c>
  1029eb:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1029ef:	75 22                	jne    102a13 <strtol+0x7e>
  1029f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1029f4:	0f b6 00             	movzbl (%eax),%eax
  1029f7:	3c 30                	cmp    $0x30,%al
  1029f9:	75 18                	jne    102a13 <strtol+0x7e>
  1029fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1029fe:	40                   	inc    %eax
  1029ff:	0f b6 00             	movzbl (%eax),%eax
  102a02:	3c 78                	cmp    $0x78,%al
  102a04:	75 0d                	jne    102a13 <strtol+0x7e>
        s += 2, base = 16;
  102a06:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102a0a:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102a11:	eb 29                	jmp    102a3c <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  102a13:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a17:	75 16                	jne    102a2f <strtol+0x9a>
  102a19:	8b 45 08             	mov    0x8(%ebp),%eax
  102a1c:	0f b6 00             	movzbl (%eax),%eax
  102a1f:	3c 30                	cmp    $0x30,%al
  102a21:	75 0c                	jne    102a2f <strtol+0x9a>
        s ++, base = 8;
  102a23:	ff 45 08             	incl   0x8(%ebp)
  102a26:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102a2d:	eb 0d                	jmp    102a3c <strtol+0xa7>
    }
    else if (base == 0) {
  102a2f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102a33:	75 07                	jne    102a3c <strtol+0xa7>
        base = 10;
  102a35:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102a3c:	8b 45 08             	mov    0x8(%ebp),%eax
  102a3f:	0f b6 00             	movzbl (%eax),%eax
  102a42:	3c 2f                	cmp    $0x2f,%al
  102a44:	7e 1b                	jle    102a61 <strtol+0xcc>
  102a46:	8b 45 08             	mov    0x8(%ebp),%eax
  102a49:	0f b6 00             	movzbl (%eax),%eax
  102a4c:	3c 39                	cmp    $0x39,%al
  102a4e:	7f 11                	jg     102a61 <strtol+0xcc>
            dig = *s - '0';
  102a50:	8b 45 08             	mov    0x8(%ebp),%eax
  102a53:	0f b6 00             	movzbl (%eax),%eax
  102a56:	0f be c0             	movsbl %al,%eax
  102a59:	83 e8 30             	sub    $0x30,%eax
  102a5c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a5f:	eb 48                	jmp    102aa9 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102a61:	8b 45 08             	mov    0x8(%ebp),%eax
  102a64:	0f b6 00             	movzbl (%eax),%eax
  102a67:	3c 60                	cmp    $0x60,%al
  102a69:	7e 1b                	jle    102a86 <strtol+0xf1>
  102a6b:	8b 45 08             	mov    0x8(%ebp),%eax
  102a6e:	0f b6 00             	movzbl (%eax),%eax
  102a71:	3c 7a                	cmp    $0x7a,%al
  102a73:	7f 11                	jg     102a86 <strtol+0xf1>
            dig = *s - 'a' + 10;
  102a75:	8b 45 08             	mov    0x8(%ebp),%eax
  102a78:	0f b6 00             	movzbl (%eax),%eax
  102a7b:	0f be c0             	movsbl %al,%eax
  102a7e:	83 e8 57             	sub    $0x57,%eax
  102a81:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102a84:	eb 23                	jmp    102aa9 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102a86:	8b 45 08             	mov    0x8(%ebp),%eax
  102a89:	0f b6 00             	movzbl (%eax),%eax
  102a8c:	3c 40                	cmp    $0x40,%al
  102a8e:	7e 3b                	jle    102acb <strtol+0x136>
  102a90:	8b 45 08             	mov    0x8(%ebp),%eax
  102a93:	0f b6 00             	movzbl (%eax),%eax
  102a96:	3c 5a                	cmp    $0x5a,%al
  102a98:	7f 31                	jg     102acb <strtol+0x136>
            dig = *s - 'A' + 10;
  102a9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9d:	0f b6 00             	movzbl (%eax),%eax
  102aa0:	0f be c0             	movsbl %al,%eax
  102aa3:	83 e8 37             	sub    $0x37,%eax
  102aa6:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102aa9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102aac:	3b 45 10             	cmp    0x10(%ebp),%eax
  102aaf:	7d 19                	jge    102aca <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  102ab1:	ff 45 08             	incl   0x8(%ebp)
  102ab4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ab7:	0f af 45 10          	imul   0x10(%ebp),%eax
  102abb:	89 c2                	mov    %eax,%edx
  102abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ac0:	01 d0                	add    %edx,%eax
  102ac2:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102ac5:	e9 72 ff ff ff       	jmp    102a3c <strtol+0xa7>
            break;
  102aca:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102acb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102acf:	74 08                	je     102ad9 <strtol+0x144>
        *endptr = (char *) s;
  102ad1:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad4:	8b 55 08             	mov    0x8(%ebp),%edx
  102ad7:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102ad9:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102add:	74 07                	je     102ae6 <strtol+0x151>
  102adf:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102ae2:	f7 d8                	neg    %eax
  102ae4:	eb 03                	jmp    102ae9 <strtol+0x154>
  102ae6:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102ae9:	c9                   	leave  
  102aea:	c3                   	ret    

00102aeb <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102aeb:	55                   	push   %ebp
  102aec:	89 e5                	mov    %esp,%ebp
  102aee:	57                   	push   %edi
  102aef:	83 ec 24             	sub    $0x24,%esp
  102af2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102af5:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102af8:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102afc:	8b 45 08             	mov    0x8(%ebp),%eax
  102aff:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102b02:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102b05:	8b 45 10             	mov    0x10(%ebp),%eax
  102b08:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102b0b:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102b0e:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102b12:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102b15:	89 d7                	mov    %edx,%edi
  102b17:	f3 aa                	rep stos %al,%es:(%edi)
  102b19:	89 fa                	mov    %edi,%edx
  102b1b:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b1e:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102b21:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102b24:	83 c4 24             	add    $0x24,%esp
  102b27:	5f                   	pop    %edi
  102b28:	5d                   	pop    %ebp
  102b29:	c3                   	ret    

00102b2a <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102b2a:	55                   	push   %ebp
  102b2b:	89 e5                	mov    %esp,%ebp
  102b2d:	57                   	push   %edi
  102b2e:	56                   	push   %esi
  102b2f:	53                   	push   %ebx
  102b30:	83 ec 30             	sub    $0x30,%esp
  102b33:	8b 45 08             	mov    0x8(%ebp),%eax
  102b36:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102b39:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102b3f:	8b 45 10             	mov    0x10(%ebp),%eax
  102b42:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102b45:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b48:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102b4b:	73 42                	jae    102b8f <memmove+0x65>
  102b4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102b50:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102b53:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b56:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102b59:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b5c:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102b5f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b62:	c1 e8 02             	shr    $0x2,%eax
  102b65:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102b67:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b6a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102b6d:	89 d7                	mov    %edx,%edi
  102b6f:	89 c6                	mov    %eax,%esi
  102b71:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102b73:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102b76:	83 e1 03             	and    $0x3,%ecx
  102b79:	74 02                	je     102b7d <memmove+0x53>
  102b7b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102b7d:	89 f0                	mov    %esi,%eax
  102b7f:	89 fa                	mov    %edi,%edx
  102b81:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102b84:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102b87:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  102b8a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  102b8d:	eb 36                	jmp    102bc5 <memmove+0x9b>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102b8f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b92:	8d 50 ff             	lea    -0x1(%eax),%edx
  102b95:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102b98:	01 c2                	add    %eax,%edx
  102b9a:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102b9d:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102ba0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ba3:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  102ba6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ba9:	89 c1                	mov    %eax,%ecx
  102bab:	89 d8                	mov    %ebx,%eax
  102bad:	89 d6                	mov    %edx,%esi
  102baf:	89 c7                	mov    %eax,%edi
  102bb1:	fd                   	std    
  102bb2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102bb4:	fc                   	cld    
  102bb5:	89 f8                	mov    %edi,%eax
  102bb7:	89 f2                	mov    %esi,%edx
  102bb9:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102bbc:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102bbf:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  102bc2:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102bc5:	83 c4 30             	add    $0x30,%esp
  102bc8:	5b                   	pop    %ebx
  102bc9:	5e                   	pop    %esi
  102bca:	5f                   	pop    %edi
  102bcb:	5d                   	pop    %ebp
  102bcc:	c3                   	ret    

00102bcd <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102bcd:	55                   	push   %ebp
  102bce:	89 e5                	mov    %esp,%ebp
  102bd0:	57                   	push   %edi
  102bd1:	56                   	push   %esi
  102bd2:	83 ec 20             	sub    $0x20,%esp
  102bd5:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bdb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bde:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102be1:	8b 45 10             	mov    0x10(%ebp),%eax
  102be4:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102be7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102bea:	c1 e8 02             	shr    $0x2,%eax
  102bed:	89 c1                	mov    %eax,%ecx
    asm volatile (
  102bef:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bf2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102bf5:	89 d7                	mov    %edx,%edi
  102bf7:	89 c6                	mov    %eax,%esi
  102bf9:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102bfb:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102bfe:	83 e1 03             	and    $0x3,%ecx
  102c01:	74 02                	je     102c05 <memcpy+0x38>
  102c03:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102c05:	89 f0                	mov    %esi,%eax
  102c07:	89 fa                	mov    %edi,%edx
  102c09:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102c0c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102c0f:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  102c12:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102c15:	83 c4 20             	add    $0x20,%esp
  102c18:	5e                   	pop    %esi
  102c19:	5f                   	pop    %edi
  102c1a:	5d                   	pop    %ebp
  102c1b:	c3                   	ret    

00102c1c <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102c1c:	55                   	push   %ebp
  102c1d:	89 e5                	mov    %esp,%ebp
  102c1f:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102c22:	8b 45 08             	mov    0x8(%ebp),%eax
  102c25:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102c28:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c2b:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102c2e:	eb 2e                	jmp    102c5e <memcmp+0x42>
        if (*s1 != *s2) {
  102c30:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c33:	0f b6 10             	movzbl (%eax),%edx
  102c36:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c39:	0f b6 00             	movzbl (%eax),%eax
  102c3c:	38 c2                	cmp    %al,%dl
  102c3e:	74 18                	je     102c58 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c40:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c43:	0f b6 00             	movzbl (%eax),%eax
  102c46:	0f b6 d0             	movzbl %al,%edx
  102c49:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102c4c:	0f b6 00             	movzbl (%eax),%eax
  102c4f:	0f b6 c0             	movzbl %al,%eax
  102c52:	29 c2                	sub    %eax,%edx
  102c54:	89 d0                	mov    %edx,%eax
  102c56:	eb 18                	jmp    102c70 <memcmp+0x54>
        }
        s1 ++, s2 ++;
  102c58:	ff 45 fc             	incl   -0x4(%ebp)
  102c5b:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  102c5e:	8b 45 10             	mov    0x10(%ebp),%eax
  102c61:	8d 50 ff             	lea    -0x1(%eax),%edx
  102c64:	89 55 10             	mov    %edx,0x10(%ebp)
  102c67:	85 c0                	test   %eax,%eax
  102c69:	75 c5                	jne    102c30 <memcmp+0x14>
    }
    return 0;
  102c6b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c70:	c9                   	leave  
  102c71:	c3                   	ret    

00102c72 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102c72:	55                   	push   %ebp
  102c73:	89 e5                	mov    %esp,%ebp
  102c75:	83 ec 58             	sub    $0x58,%esp
  102c78:	8b 45 10             	mov    0x10(%ebp),%eax
  102c7b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102c7e:	8b 45 14             	mov    0x14(%ebp),%eax
  102c81:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102c84:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102c87:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102c8a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102c8d:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102c90:	8b 45 18             	mov    0x18(%ebp),%eax
  102c93:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102c96:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102c99:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102c9c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102c9f:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102ca2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ca5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ca8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102cac:	74 1c                	je     102cca <printnum+0x58>
  102cae:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cb1:	ba 00 00 00 00       	mov    $0x0,%edx
  102cb6:	f7 75 e4             	divl   -0x1c(%ebp)
  102cb9:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102cbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102cbf:	ba 00 00 00 00       	mov    $0x0,%edx
  102cc4:	f7 75 e4             	divl   -0x1c(%ebp)
  102cc7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102cca:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ccd:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102cd0:	f7 75 e4             	divl   -0x1c(%ebp)
  102cd3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102cd6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102cd9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102cdc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102cdf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102ce2:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102ce5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ce8:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102ceb:	8b 45 18             	mov    0x18(%ebp),%eax
  102cee:	ba 00 00 00 00       	mov    $0x0,%edx
  102cf3:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  102cf6:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  102cf9:	19 d1                	sbb    %edx,%ecx
  102cfb:	72 4c                	jb     102d49 <printnum+0xd7>
        printnum(putch, putdat, result, base, width - 1, padc);
  102cfd:	8b 45 1c             	mov    0x1c(%ebp),%eax
  102d00:	8d 50 ff             	lea    -0x1(%eax),%edx
  102d03:	8b 45 20             	mov    0x20(%ebp),%eax
  102d06:	89 44 24 18          	mov    %eax,0x18(%esp)
  102d0a:	89 54 24 14          	mov    %edx,0x14(%esp)
  102d0e:	8b 45 18             	mov    0x18(%ebp),%eax
  102d11:	89 44 24 10          	mov    %eax,0x10(%esp)
  102d15:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102d18:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102d1b:	89 44 24 08          	mov    %eax,0x8(%esp)
  102d1f:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102d23:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d26:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2d:	89 04 24             	mov    %eax,(%esp)
  102d30:	e8 3d ff ff ff       	call   102c72 <printnum>
  102d35:	eb 1b                	jmp    102d52 <printnum+0xe0>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  102d37:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d3a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d3e:	8b 45 20             	mov    0x20(%ebp),%eax
  102d41:	89 04 24             	mov    %eax,(%esp)
  102d44:	8b 45 08             	mov    0x8(%ebp),%eax
  102d47:	ff d0                	call   *%eax
        while (-- width > 0)
  102d49:	ff 4d 1c             	decl   0x1c(%ebp)
  102d4c:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102d50:	7f e5                	jg     102d37 <printnum+0xc5>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102d52:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102d55:	05 70 3a 10 00       	add    $0x103a70,%eax
  102d5a:	0f b6 00             	movzbl (%eax),%eax
  102d5d:	0f be c0             	movsbl %al,%eax
  102d60:	8b 55 0c             	mov    0xc(%ebp),%edx
  102d63:	89 54 24 04          	mov    %edx,0x4(%esp)
  102d67:	89 04 24             	mov    %eax,(%esp)
  102d6a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6d:	ff d0                	call   *%eax
}
  102d6f:	90                   	nop
  102d70:	c9                   	leave  
  102d71:	c3                   	ret    

00102d72 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102d72:	55                   	push   %ebp
  102d73:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102d75:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102d79:	7e 14                	jle    102d8f <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102d7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d7e:	8b 00                	mov    (%eax),%eax
  102d80:	8d 48 08             	lea    0x8(%eax),%ecx
  102d83:	8b 55 08             	mov    0x8(%ebp),%edx
  102d86:	89 0a                	mov    %ecx,(%edx)
  102d88:	8b 50 04             	mov    0x4(%eax),%edx
  102d8b:	8b 00                	mov    (%eax),%eax
  102d8d:	eb 30                	jmp    102dbf <getuint+0x4d>
    }
    else if (lflag) {
  102d8f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102d93:	74 16                	je     102dab <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102d95:	8b 45 08             	mov    0x8(%ebp),%eax
  102d98:	8b 00                	mov    (%eax),%eax
  102d9a:	8d 48 04             	lea    0x4(%eax),%ecx
  102d9d:	8b 55 08             	mov    0x8(%ebp),%edx
  102da0:	89 0a                	mov    %ecx,(%edx)
  102da2:	8b 00                	mov    (%eax),%eax
  102da4:	ba 00 00 00 00       	mov    $0x0,%edx
  102da9:	eb 14                	jmp    102dbf <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102dab:	8b 45 08             	mov    0x8(%ebp),%eax
  102dae:	8b 00                	mov    (%eax),%eax
  102db0:	8d 48 04             	lea    0x4(%eax),%ecx
  102db3:	8b 55 08             	mov    0x8(%ebp),%edx
  102db6:	89 0a                	mov    %ecx,(%edx)
  102db8:	8b 00                	mov    (%eax),%eax
  102dba:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102dbf:	5d                   	pop    %ebp
  102dc0:	c3                   	ret    

00102dc1 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102dc1:	55                   	push   %ebp
  102dc2:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102dc4:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102dc8:	7e 14                	jle    102dde <getint+0x1d>
        return va_arg(*ap, long long);
  102dca:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcd:	8b 00                	mov    (%eax),%eax
  102dcf:	8d 48 08             	lea    0x8(%eax),%ecx
  102dd2:	8b 55 08             	mov    0x8(%ebp),%edx
  102dd5:	89 0a                	mov    %ecx,(%edx)
  102dd7:	8b 50 04             	mov    0x4(%eax),%edx
  102dda:	8b 00                	mov    (%eax),%eax
  102ddc:	eb 28                	jmp    102e06 <getint+0x45>
    }
    else if (lflag) {
  102dde:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102de2:	74 12                	je     102df6 <getint+0x35>
        return va_arg(*ap, long);
  102de4:	8b 45 08             	mov    0x8(%ebp),%eax
  102de7:	8b 00                	mov    (%eax),%eax
  102de9:	8d 48 04             	lea    0x4(%eax),%ecx
  102dec:	8b 55 08             	mov    0x8(%ebp),%edx
  102def:	89 0a                	mov    %ecx,(%edx)
  102df1:	8b 00                	mov    (%eax),%eax
  102df3:	99                   	cltd   
  102df4:	eb 10                	jmp    102e06 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102df6:	8b 45 08             	mov    0x8(%ebp),%eax
  102df9:	8b 00                	mov    (%eax),%eax
  102dfb:	8d 48 04             	lea    0x4(%eax),%ecx
  102dfe:	8b 55 08             	mov    0x8(%ebp),%edx
  102e01:	89 0a                	mov    %ecx,(%edx)
  102e03:	8b 00                	mov    (%eax),%eax
  102e05:	99                   	cltd   
    }
}
  102e06:	5d                   	pop    %ebp
  102e07:	c3                   	ret    

00102e08 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102e08:	55                   	push   %ebp
  102e09:	89 e5                	mov    %esp,%ebp
  102e0b:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102e0e:	8d 45 14             	lea    0x14(%ebp),%eax
  102e11:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102e14:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102e17:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102e1b:	8b 45 10             	mov    0x10(%ebp),%eax
  102e1e:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e22:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e25:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e29:	8b 45 08             	mov    0x8(%ebp),%eax
  102e2c:	89 04 24             	mov    %eax,(%esp)
  102e2f:	e8 03 00 00 00       	call   102e37 <vprintfmt>
    va_end(ap);
}
  102e34:	90                   	nop
  102e35:	c9                   	leave  
  102e36:	c3                   	ret    

00102e37 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102e37:	55                   	push   %ebp
  102e38:	89 e5                	mov    %esp,%ebp
  102e3a:	56                   	push   %esi
  102e3b:	53                   	push   %ebx
  102e3c:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e3f:	eb 17                	jmp    102e58 <vprintfmt+0x21>
            if (ch == '\0') {
  102e41:	85 db                	test   %ebx,%ebx
  102e43:	0f 84 bf 03 00 00    	je     103208 <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  102e49:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e4c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e50:	89 1c 24             	mov    %ebx,(%esp)
  102e53:	8b 45 08             	mov    0x8(%ebp),%eax
  102e56:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102e58:	8b 45 10             	mov    0x10(%ebp),%eax
  102e5b:	8d 50 01             	lea    0x1(%eax),%edx
  102e5e:	89 55 10             	mov    %edx,0x10(%ebp)
  102e61:	0f b6 00             	movzbl (%eax),%eax
  102e64:	0f b6 d8             	movzbl %al,%ebx
  102e67:	83 fb 25             	cmp    $0x25,%ebx
  102e6a:	75 d5                	jne    102e41 <vprintfmt+0xa>
        }

        // Process a %-escape sequence
        char padc = ' ';
  102e6c:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102e70:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102e77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102e7a:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102e7d:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102e84:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e87:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102e8a:	8b 45 10             	mov    0x10(%ebp),%eax
  102e8d:	8d 50 01             	lea    0x1(%eax),%edx
  102e90:	89 55 10             	mov    %edx,0x10(%ebp)
  102e93:	0f b6 00             	movzbl (%eax),%eax
  102e96:	0f b6 d8             	movzbl %al,%ebx
  102e99:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102e9c:	83 f8 55             	cmp    $0x55,%eax
  102e9f:	0f 87 37 03 00 00    	ja     1031dc <vprintfmt+0x3a5>
  102ea5:	8b 04 85 94 3a 10 00 	mov    0x103a94(,%eax,4),%eax
  102eac:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102eae:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102eb2:	eb d6                	jmp    102e8a <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102eb4:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102eb8:	eb d0                	jmp    102e8a <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102eba:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102ec1:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102ec4:	89 d0                	mov    %edx,%eax
  102ec6:	c1 e0 02             	shl    $0x2,%eax
  102ec9:	01 d0                	add    %edx,%eax
  102ecb:	01 c0                	add    %eax,%eax
  102ecd:	01 d8                	add    %ebx,%eax
  102ecf:	83 e8 30             	sub    $0x30,%eax
  102ed2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102ed5:	8b 45 10             	mov    0x10(%ebp),%eax
  102ed8:	0f b6 00             	movzbl (%eax),%eax
  102edb:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102ede:	83 fb 2f             	cmp    $0x2f,%ebx
  102ee1:	7e 38                	jle    102f1b <vprintfmt+0xe4>
  102ee3:	83 fb 39             	cmp    $0x39,%ebx
  102ee6:	7f 33                	jg     102f1b <vprintfmt+0xe4>
            for (precision = 0; ; ++ fmt) {
  102ee8:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  102eeb:	eb d4                	jmp    102ec1 <vprintfmt+0x8a>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  102eed:	8b 45 14             	mov    0x14(%ebp),%eax
  102ef0:	8d 50 04             	lea    0x4(%eax),%edx
  102ef3:	89 55 14             	mov    %edx,0x14(%ebp)
  102ef6:	8b 00                	mov    (%eax),%eax
  102ef8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102efb:	eb 1f                	jmp    102f1c <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  102efd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f01:	79 87                	jns    102e8a <vprintfmt+0x53>
                width = 0;
  102f03:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102f0a:	e9 7b ff ff ff       	jmp    102e8a <vprintfmt+0x53>

        case '#':
            altflag = 1;
  102f0f:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102f16:	e9 6f ff ff ff       	jmp    102e8a <vprintfmt+0x53>
            goto process_precision;
  102f1b:	90                   	nop

        process_precision:
            if (width < 0)
  102f1c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102f20:	0f 89 64 ff ff ff    	jns    102e8a <vprintfmt+0x53>
                width = precision, precision = -1;
  102f26:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102f29:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102f2c:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102f33:	e9 52 ff ff ff       	jmp    102e8a <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102f38:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  102f3b:	e9 4a ff ff ff       	jmp    102e8a <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102f40:	8b 45 14             	mov    0x14(%ebp),%eax
  102f43:	8d 50 04             	lea    0x4(%eax),%edx
  102f46:	89 55 14             	mov    %edx,0x14(%ebp)
  102f49:	8b 00                	mov    (%eax),%eax
  102f4b:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f4e:	89 54 24 04          	mov    %edx,0x4(%esp)
  102f52:	89 04 24             	mov    %eax,(%esp)
  102f55:	8b 45 08             	mov    0x8(%ebp),%eax
  102f58:	ff d0                	call   *%eax
            break;
  102f5a:	e9 a4 02 00 00       	jmp    103203 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102f5f:	8b 45 14             	mov    0x14(%ebp),%eax
  102f62:	8d 50 04             	lea    0x4(%eax),%edx
  102f65:	89 55 14             	mov    %edx,0x14(%ebp)
  102f68:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102f6a:	85 db                	test   %ebx,%ebx
  102f6c:	79 02                	jns    102f70 <vprintfmt+0x139>
                err = -err;
  102f6e:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102f70:	83 fb 06             	cmp    $0x6,%ebx
  102f73:	7f 0b                	jg     102f80 <vprintfmt+0x149>
  102f75:	8b 34 9d 54 3a 10 00 	mov    0x103a54(,%ebx,4),%esi
  102f7c:	85 f6                	test   %esi,%esi
  102f7e:	75 23                	jne    102fa3 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  102f80:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102f84:	c7 44 24 08 81 3a 10 	movl   $0x103a81,0x8(%esp)
  102f8b:	00 
  102f8c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f8f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f93:	8b 45 08             	mov    0x8(%ebp),%eax
  102f96:	89 04 24             	mov    %eax,(%esp)
  102f99:	e8 6a fe ff ff       	call   102e08 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102f9e:	e9 60 02 00 00       	jmp    103203 <vprintfmt+0x3cc>
                printfmt(putch, putdat, "%s", p);
  102fa3:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102fa7:	c7 44 24 08 8a 3a 10 	movl   $0x103a8a,0x8(%esp)
  102fae:	00 
  102faf:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fb2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fb6:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb9:	89 04 24             	mov    %eax,(%esp)
  102fbc:	e8 47 fe ff ff       	call   102e08 <printfmt>
            break;
  102fc1:	e9 3d 02 00 00       	jmp    103203 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102fc6:	8b 45 14             	mov    0x14(%ebp),%eax
  102fc9:	8d 50 04             	lea    0x4(%eax),%edx
  102fcc:	89 55 14             	mov    %edx,0x14(%ebp)
  102fcf:	8b 30                	mov    (%eax),%esi
  102fd1:	85 f6                	test   %esi,%esi
  102fd3:	75 05                	jne    102fda <vprintfmt+0x1a3>
                p = "(null)";
  102fd5:	be 8d 3a 10 00       	mov    $0x103a8d,%esi
            }
            if (width > 0 && padc != '-') {
  102fda:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102fde:	7e 76                	jle    103056 <vprintfmt+0x21f>
  102fe0:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102fe4:	74 70                	je     103056 <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102fe6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102fe9:	89 44 24 04          	mov    %eax,0x4(%esp)
  102fed:	89 34 24             	mov    %esi,(%esp)
  102ff0:	e8 ff f7 ff ff       	call   1027f4 <strnlen>
  102ff5:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102ff8:	29 c2                	sub    %eax,%edx
  102ffa:	89 d0                	mov    %edx,%eax
  102ffc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fff:	eb 16                	jmp    103017 <vprintfmt+0x1e0>
                    putch(padc, putdat);
  103001:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  103005:	8b 55 0c             	mov    0xc(%ebp),%edx
  103008:	89 54 24 04          	mov    %edx,0x4(%esp)
  10300c:	89 04 24             	mov    %eax,(%esp)
  10300f:	8b 45 08             	mov    0x8(%ebp),%eax
  103012:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  103014:	ff 4d e8             	decl   -0x18(%ebp)
  103017:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  10301b:	7f e4                	jg     103001 <vprintfmt+0x1ca>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  10301d:	eb 37                	jmp    103056 <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  10301f:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103023:	74 1f                	je     103044 <vprintfmt+0x20d>
  103025:	83 fb 1f             	cmp    $0x1f,%ebx
  103028:	7e 05                	jle    10302f <vprintfmt+0x1f8>
  10302a:	83 fb 7e             	cmp    $0x7e,%ebx
  10302d:	7e 15                	jle    103044 <vprintfmt+0x20d>
                    putch('?', putdat);
  10302f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103032:	89 44 24 04          	mov    %eax,0x4(%esp)
  103036:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  10303d:	8b 45 08             	mov    0x8(%ebp),%eax
  103040:	ff d0                	call   *%eax
  103042:	eb 0f                	jmp    103053 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  103044:	8b 45 0c             	mov    0xc(%ebp),%eax
  103047:	89 44 24 04          	mov    %eax,0x4(%esp)
  10304b:	89 1c 24             	mov    %ebx,(%esp)
  10304e:	8b 45 08             	mov    0x8(%ebp),%eax
  103051:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103053:	ff 4d e8             	decl   -0x18(%ebp)
  103056:	89 f0                	mov    %esi,%eax
  103058:	8d 70 01             	lea    0x1(%eax),%esi
  10305b:	0f b6 00             	movzbl (%eax),%eax
  10305e:	0f be d8             	movsbl %al,%ebx
  103061:	85 db                	test   %ebx,%ebx
  103063:	74 27                	je     10308c <vprintfmt+0x255>
  103065:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103069:	78 b4                	js     10301f <vprintfmt+0x1e8>
  10306b:	ff 4d e4             	decl   -0x1c(%ebp)
  10306e:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103072:	79 ab                	jns    10301f <vprintfmt+0x1e8>
                }
            }
            for (; width > 0; width --) {
  103074:	eb 16                	jmp    10308c <vprintfmt+0x255>
                putch(' ', putdat);
  103076:	8b 45 0c             	mov    0xc(%ebp),%eax
  103079:	89 44 24 04          	mov    %eax,0x4(%esp)
  10307d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  103084:	8b 45 08             	mov    0x8(%ebp),%eax
  103087:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  103089:	ff 4d e8             	decl   -0x18(%ebp)
  10308c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103090:	7f e4                	jg     103076 <vprintfmt+0x23f>
            }
            break;
  103092:	e9 6c 01 00 00       	jmp    103203 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  103097:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10309a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10309e:	8d 45 14             	lea    0x14(%ebp),%eax
  1030a1:	89 04 24             	mov    %eax,(%esp)
  1030a4:	e8 18 fd ff ff       	call   102dc1 <getint>
  1030a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030ac:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1030af:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030b5:	85 d2                	test   %edx,%edx
  1030b7:	79 26                	jns    1030df <vprintfmt+0x2a8>
                putch('-', putdat);
  1030b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030bc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030c0:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1030c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ca:	ff d0                	call   *%eax
                num = -(long long)num;
  1030cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1030cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1030d2:	f7 d8                	neg    %eax
  1030d4:	83 d2 00             	adc    $0x0,%edx
  1030d7:	f7 da                	neg    %edx
  1030d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1030dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  1030df:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1030e6:	e9 a8 00 00 00       	jmp    103193 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1030eb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1030ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1030f2:	8d 45 14             	lea    0x14(%ebp),%eax
  1030f5:	89 04 24             	mov    %eax,(%esp)
  1030f8:	e8 75 fc ff ff       	call   102d72 <getuint>
  1030fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103100:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103103:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10310a:	e9 84 00 00 00       	jmp    103193 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  10310f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103112:	89 44 24 04          	mov    %eax,0x4(%esp)
  103116:	8d 45 14             	lea    0x14(%ebp),%eax
  103119:	89 04 24             	mov    %eax,(%esp)
  10311c:	e8 51 fc ff ff       	call   102d72 <getuint>
  103121:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103124:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  103127:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  10312e:	eb 63                	jmp    103193 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  103130:	8b 45 0c             	mov    0xc(%ebp),%eax
  103133:	89 44 24 04          	mov    %eax,0x4(%esp)
  103137:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  10313e:	8b 45 08             	mov    0x8(%ebp),%eax
  103141:	ff d0                	call   *%eax
            putch('x', putdat);
  103143:	8b 45 0c             	mov    0xc(%ebp),%eax
  103146:	89 44 24 04          	mov    %eax,0x4(%esp)
  10314a:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103151:	8b 45 08             	mov    0x8(%ebp),%eax
  103154:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  103156:	8b 45 14             	mov    0x14(%ebp),%eax
  103159:	8d 50 04             	lea    0x4(%eax),%edx
  10315c:	89 55 14             	mov    %edx,0x14(%ebp)
  10315f:	8b 00                	mov    (%eax),%eax
  103161:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103164:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  10316b:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103172:	eb 1f                	jmp    103193 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  103174:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103177:	89 44 24 04          	mov    %eax,0x4(%esp)
  10317b:	8d 45 14             	lea    0x14(%ebp),%eax
  10317e:	89 04 24             	mov    %eax,(%esp)
  103181:	e8 ec fb ff ff       	call   102d72 <getuint>
  103186:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103189:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  10318c:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103193:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  103197:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10319a:	89 54 24 18          	mov    %edx,0x18(%esp)
  10319e:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1031a1:	89 54 24 14          	mov    %edx,0x14(%esp)
  1031a5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1031a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1031af:	89 44 24 08          	mov    %eax,0x8(%esp)
  1031b3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1031b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031ba:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031be:	8b 45 08             	mov    0x8(%ebp),%eax
  1031c1:	89 04 24             	mov    %eax,(%esp)
  1031c4:	e8 a9 fa ff ff       	call   102c72 <printnum>
            break;
  1031c9:	eb 38                	jmp    103203 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  1031cb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031ce:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031d2:	89 1c 24             	mov    %ebx,(%esp)
  1031d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d8:	ff d0                	call   *%eax
            break;
  1031da:	eb 27                	jmp    103203 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  1031dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031e3:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1031ea:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ed:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1031ef:	ff 4d 10             	decl   0x10(%ebp)
  1031f2:	eb 03                	jmp    1031f7 <vprintfmt+0x3c0>
  1031f4:	ff 4d 10             	decl   0x10(%ebp)
  1031f7:	8b 45 10             	mov    0x10(%ebp),%eax
  1031fa:	48                   	dec    %eax
  1031fb:	0f b6 00             	movzbl (%eax),%eax
  1031fe:	3c 25                	cmp    $0x25,%al
  103200:	75 f2                	jne    1031f4 <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  103202:	90                   	nop
    while (1) {
  103203:	e9 37 fc ff ff       	jmp    102e3f <vprintfmt+0x8>
                return;
  103208:	90                   	nop
        }
    }
}
  103209:	83 c4 40             	add    $0x40,%esp
  10320c:	5b                   	pop    %ebx
  10320d:	5e                   	pop    %esi
  10320e:	5d                   	pop    %ebp
  10320f:	c3                   	ret    

00103210 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103210:	55                   	push   %ebp
  103211:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103213:	8b 45 0c             	mov    0xc(%ebp),%eax
  103216:	8b 40 08             	mov    0x8(%eax),%eax
  103219:	8d 50 01             	lea    0x1(%eax),%edx
  10321c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10321f:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103222:	8b 45 0c             	mov    0xc(%ebp),%eax
  103225:	8b 10                	mov    (%eax),%edx
  103227:	8b 45 0c             	mov    0xc(%ebp),%eax
  10322a:	8b 40 04             	mov    0x4(%eax),%eax
  10322d:	39 c2                	cmp    %eax,%edx
  10322f:	73 12                	jae    103243 <sprintputch+0x33>
        *b->buf ++ = ch;
  103231:	8b 45 0c             	mov    0xc(%ebp),%eax
  103234:	8b 00                	mov    (%eax),%eax
  103236:	8d 48 01             	lea    0x1(%eax),%ecx
  103239:	8b 55 0c             	mov    0xc(%ebp),%edx
  10323c:	89 0a                	mov    %ecx,(%edx)
  10323e:	8b 55 08             	mov    0x8(%ebp),%edx
  103241:	88 10                	mov    %dl,(%eax)
    }
}
  103243:	90                   	nop
  103244:	5d                   	pop    %ebp
  103245:	c3                   	ret    

00103246 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103246:	55                   	push   %ebp
  103247:	89 e5                	mov    %esp,%ebp
  103249:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10324c:	8d 45 14             	lea    0x14(%ebp),%eax
  10324f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103252:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103255:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103259:	8b 45 10             	mov    0x10(%ebp),%eax
  10325c:	89 44 24 08          	mov    %eax,0x8(%esp)
  103260:	8b 45 0c             	mov    0xc(%ebp),%eax
  103263:	89 44 24 04          	mov    %eax,0x4(%esp)
  103267:	8b 45 08             	mov    0x8(%ebp),%eax
  10326a:	89 04 24             	mov    %eax,(%esp)
  10326d:	e8 08 00 00 00       	call   10327a <vsnprintf>
  103272:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103275:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103278:	c9                   	leave  
  103279:	c3                   	ret    

0010327a <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  10327a:	55                   	push   %ebp
  10327b:	89 e5                	mov    %esp,%ebp
  10327d:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103280:	8b 45 08             	mov    0x8(%ebp),%eax
  103283:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103286:	8b 45 0c             	mov    0xc(%ebp),%eax
  103289:	8d 50 ff             	lea    -0x1(%eax),%edx
  10328c:	8b 45 08             	mov    0x8(%ebp),%eax
  10328f:	01 d0                	add    %edx,%eax
  103291:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103294:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10329b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  10329f:	74 0a                	je     1032ab <vsnprintf+0x31>
  1032a1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1032a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1032a7:	39 c2                	cmp    %eax,%edx
  1032a9:	76 07                	jbe    1032b2 <vsnprintf+0x38>
        return -E_INVAL;
  1032ab:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1032b0:	eb 2a                	jmp    1032dc <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1032b2:	8b 45 14             	mov    0x14(%ebp),%eax
  1032b5:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1032b9:	8b 45 10             	mov    0x10(%ebp),%eax
  1032bc:	89 44 24 08          	mov    %eax,0x8(%esp)
  1032c0:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1032c3:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032c7:	c7 04 24 10 32 10 00 	movl   $0x103210,(%esp)
  1032ce:	e8 64 fb ff ff       	call   102e37 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  1032d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1032d6:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  1032d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1032dc:	c9                   	leave  
  1032dd:	c3                   	ret    

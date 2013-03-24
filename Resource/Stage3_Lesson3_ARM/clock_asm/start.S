
.globl _start
_start:

/* Ӳ����ص����� : ������Ļ���ַ����CPU*/
    /* Peri port setup */
    ldr r0, =0x70000000
    orr r0, r0, #0x13
    
/* �ؿ��Ź� */
/* ��WTCON(0x7E004000)д0 */
	
	ldr r0, =0x7E004000
	mov r1, #0
	str r1, [r0]
	
	/*����ʱ�� */
	bl clock_init

	/* ����ջ, ����C���� */
	ldr sp, =8*1024
	bl main
halt:
	b halt	
.global _start
.global IRQ_handle

_start:
	// �رտ��Ź�
	ldr	r0, =0xE2700000			
	mov	r1, #0
	str	r1, [r0]

	// ����ջ���Ա����c����
	ldr	sp, =0x40000000		

	// ���ж�
	mov r0, #0x53			
	msr CPSR_cxsf, r0	

	// ����ʼ��ʱ��		
	bl clock_init	

	// ����main����
	bl main	

IRQ_handle:
	// �����ж�ģʽ��ջ
	ldr sp, =0xD0037F80
	// �����ֳ�
	sub lr, lr, #4				
	stmfd sp!, {r0-r12, lr}
	// ��ת���жϴ�������
	bl	irq_handler		
	// �ָ��ֳ�
	ldmfd sp!, {r0-r12, pc}^

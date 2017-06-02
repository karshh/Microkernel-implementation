#include "interruptHandler.h"
#include "td.h"
#include "request.h"
#include "kernelMacros.h"
#include "bwio.h"

void initHandlers(){
	//Set location on swi entry point
	int ptr =(int) swiHandler+ REDBOOT_LOAD_OFFSET;
	* ((int *) (0x28)) = ((int) ptr) ;
	ptr =(int) hwiHandler+ REDBOOT_LOAD_OFFSET;
	* ((int *) (0x38)) = ((int) ptr) ;

}

 request *  activate(volatile TD *td){
	request * rq = 0;
	int r;
/*
	//Set location on swi entry point
	int ptr =(int) swiHandler+ REDBOOT_LOAD_OFFSET;
	* ((int *) (0x28)) = ((int) ptr) ;
*/
	if(td->interupted){
	td->interupted = 0;
	asm volatile(
	//r0 should equal reqVal;
	"stmfd	sp!, {r1, r4-r9, sl, fp, ip, lr }\n"
	"	msr	cpsr, #0xdf\n"
	"	mov	sp, %[tdsp]\n"
	"	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}\n"
	"	msr	cpsr, #0xd3\n"
	"	msr	spsr, r1\n"
	"	mov	lr, r2\n"
	"	msr	cpsr, #0xd2\n"
        "       ldmfd   sp!, {r0-r3}\n" //save r0-r3 on SP_IRQ
	"	msr	cpsr, #0xd3\n"
	:
	:[tdsp] "r" (td->sp)
	);
	asm volatile(
	"subs	pc, lr, #4\n");
	}
	else{
	asm volatile(
	//r0 should equal reqVal;
	"stmfd	sp!, {r1, r4-r9, sl, fp, ip, lr }\n"
	"	msr	cpsr, #0xdf\n"
	"	mov	sp, %[tdsp]\n"
	"	ldmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}\n"
	"	msr	cpsr, #0xd3\n"
	"	msr	spsr, r1\n"
	"	mov	lr, r2\n"
	"	mov	r0, %[reqVal]\n"
	:
	:[tdsp] "r" (td->sp),[reqVal] "r" (td->reqVal)
	);
	asm volatile(
	"movs	pc, lr\n");
	}

	asm volatile(
	"hwiHandler:\n" //in IRQ 11010010 mode
        "       stmfd   sp!, {r0-r3}\n" //save r0-r3 on SP_IRQ
 	//       "       mov     r0, lr\n" //save IRQ_LR into r0
        "       sub     r0, lr, #2\n" // subtracting lr by 2 to account for the two instructions that are botched due to HWI

        "       mrs     r1, spsr\n" //save IRQ_SPSR into r1
        "       msr     cpsr, #0xd3\n" //switch to supervisor mode
        "       mov     lr, r0\n" //copy r0 to SVC_LR
        "       msr     spsr,r1\n" //copy r1 to SVC_SPSR
        "       mov     r1, #0\n" //set R1 (pointer to request) to null.
	"swiHandler:" 
	//r1 contains pointer to request object
	"mov r0, r1\n"
	"mrs	r1, spsr\n"
	"mov	r2, lr\n"
	"msr	cpsr, #0xdf\n"
	"stmfd	sp!, {r1, r2, r4-r10, fp, ip, lr}\n"
	"mov	%[tdsp], sp\n"
	"msr	cpsr, #0xd3\n"
	"ldmfd	sp!, {r1, r4-r9,sl,fp,ip,lr}\n"
	"mov %[req], r0\n"
	:[tdsp] "=r" (td->sp), [req] "=r" (r)
	:
	);
        rq = (request *) r;
	
	return  rq;
}



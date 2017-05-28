#include "interruptHandler.h"
#include "td.h"
#include "request.h"
#include "kernelMacros.h"

 request *  activate(int reqVal, TD *td){
	request * rq;

	//Set location on swi entry point
	int ptr =(int) swiHandler+ REDBOOT_LOAD_OFFSET;
	* ((int *) (0x28)) = ((int) ptr) ;


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
	:[tdsp] "r" (td->sp),[reqVal] "r" (reqVal)
	);

	asm volatile(
	"movs	pc, lr\n");

	asm("swiHandler:"); //semicolon is required...apparently
	int r;
	asm volatile(
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
	return rq;
}



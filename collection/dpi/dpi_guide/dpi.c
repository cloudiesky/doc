#ifndef _TOP_H_

#define _TOP_H_ 

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>
#include <time.h>


typedef char					sWord16_c;	//16bits char  

typedef short 					sWord16;
typedef unsigned short 			uWord16;

typedef long 					sWord32;
typedef unsigned long 			uWord32;

typedef float					Word32_f;	//16bits float IEEE754
typedef double					Word64_f;	//64bits double IEEE754 

typedef	__int64 				sWord40;    //40bits 有符号长整型
typedef	unsigned __int64 		uWord40;	//40bits 无符号长整型

typedef	__int64 				sWord64;    //64bits 有符号长整型
typedef	unsigned __int64 		uWord64;	//64bits 无符号长整型


#define  MAX16     32767
#define  MIN16    -32768

#define  UMAX16     65535

#define  MAX32   (sWord32)0x7fffffff
#define  MIN32   (sWord32)0x80000000

#define  UMAX32     4294967295

#define  MAX40   (sWord40)0x7fffffffff
//#define  MIN40   (sWord40)0x8000000000
#define  MIN40     (sWord40)((sWord64)0x8000000000000000>>24)

#define  UMAX40     1099511627775

#define  MAX64   (sWord64)0x7fffffffffffffff
#define  MIN64   (sWord64)0x8000000000000000

#define  UMAX64     18446744073709551615

#define SHIFTL(data, len)  ((sWord40)(data)*(sWord40)pow(2,(len)))
#define SHIFTR(data, len)  ((sWord40)(data)/(sWord40)pow(2,(len)))


typedef struct 
{
	uWord16 PBMod;                       // PB块大小
	uWord16 FECMod;                      // Turbo编码模式
	uWord16 StepSize;                    // 信道交织跳转步长
	uWord16 OffSet;                      // 信道交织起始偏置
	uWord16 Col_Rotate_Mod;              // 信道交织列旋转的模式,0:1~8为一组循环;1:1~10为一组循环;2:1~12为一组循环;3:1~14为一组循环
	uWord16 Shift;                       // 信道交织半字节移位方向  
	uWord16 PBlen;                       // PB块长度
	
} STRUCT_ChanelIntlvPara;




// =============================== TX ==============================
void LME3460_Channel_Interleaver(uWord16 *Input,uWord16 *Output, STRUCT_ChanelIntlvPara  ChanelIntlvPara);



// ================================ RX =============================
void LME3460_Channel_Deinterleaver(sWord16 *Input,sWord16 *Output, STRUCT_ChanelIntlvPara  ChanelIntlvPara); 





#endif

#include "Sys_Top.h"
#include "svdpi.h"

void ci_rm_wrapper(
                   const uWord16 PBMod,
                   const uWord16 FECMod,
                   //.......
                   const svOpenArrayHandle sv_ci_din,
                   svOpenArrayHandle sv_ci_dou,
                   const svOpenArrayHandle sv_cdi_din,
                   svOpenArrayHandle sv_cdi_dou,
                   )
{
  STRUCT_ChanelIntlvPara ci_rm_param;
  int i,j;
  uWord16 c_ci_din[8320],c_ci_dou[8320];
  uWord16 *a, *b;

  ci_rm_param.PBMod = PBMod;
  ci_rm_param.FECMod = FECMod;
  //......

  for(i=0; i<8320; i++)
    {
      if(i < dlen)
        {
          a = (uWord16 *) svGetArrElemPtr(sv_ci_din,i);
          c_ci_din[i] = *a;
        }
      else
        c_ci_din[i] = 0;
    }

  LME3460_Channel_Interleaver(c_ci_din,c_ci_dou, ci_rm_param);
  
  for(i=0; i<dlen; i++)
    {
      b = (uWord16 *) svGetArrElemPtr(sv_ci_dou,i);
      * b = c_ci_dou[i];
    }
  
  //...
}

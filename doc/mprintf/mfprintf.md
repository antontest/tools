---
title: mfprintf
tags: mfprintf

grammar_cjkRuby: true
grammar_center:  true
grammar_code: true
grammar_tableExtra: true
---

[toc]

## 函数名称

　　**mprintf, mfprint, vmprintf, vmfprintf**  

## 函数声明

```cpp?linenums
#include <print/print.h>

int >>**mprintf**<< (const char *format, ...);
int >>**mfprintf**<< (FILE *stream, const char *format, ...);

#include <stdarg.h>
int >>**vmprintf**<< (const char *format, va_list ag);
int >>**vmfprintf**<< (FILE *stream, const char *format, va_list ag);
```

## 功能说明

　　以上函数除支持基本**printf和fprintf**的格式化输出外，同时支持==windows==和==linux==下==颜色打印==、==文字对齐==和==其他格式化==输出。  
   
   
### 颜色打印

|符号|颜色|举例|效果|
|:----:|:-----:|:--------:|:------:|
| **[r]** | 红色 | `mprintf("[r]red[n]")` |<font color="red">red</font>|
| **[g]** | 绿色 | `mprintf("[g]green[n]")` |<font color="green">green</font>|
| **[b]** | 蓝色 | `mprintf("[b]blue[n]")` |<font color="blue">blue</font>|
| **[y]** | 黄色 | `mprintf("[y]yellow[n]")` |<font color="yellow">yellow</font>|
| **[p]** | 粉红 | `mprintf("[p]pink[n]")` |<font color="pink">pink</font>|
| **[c]** | 墨绿 | `mprintf("[c]cyan[n]")` |<font color="cyan">cyan</font>|
|**[n]**|正常|`mprintf("[n]noraml[n]")` |<font color="black">normal</font>|
|**[B]**|加粗|`mprintf("[B]bold[n]")` |<font color="black" >**bold**</font>|
|**[U]**|下划线|`mprintf("[U]underline[n]")` |<font color="black" style="text-decoration:underline">underline</font>|
[颜色打印]  

**说明**：  
　　颜色和加粗、下划线可以组合输出。如：`mprintf("[BUg]bold underline green[n]");`，效果：<font style="font-weight: bold;text-decoration:underline;color:green;">bold underline green</font> 

### 文字对齐

|符号|说明|举例|效果|
|:----:|:-----:|:--------:|:------:|
|**[L]**|左对齐|`mprintf("%*s\n", 10, "[L]left");`|`left　　　　　`|
|**[R]**|右对齐|`mprintf("%*s\n", 10, "[R]right");`|`　　　　　right`|
|**[M]**|居中对齐|`mprintf("%*s\n", 10, "[M]middle");`|`　　middle　　`|
|**%-**|左对齐|`mprintf("%-*s\n", 10, "left");`|`left　　　　　`|
|**%***|右对齐|`mprintf("%*s\n", 10, "right");`|`　　　　　right`|
|**%+**|居中对齐|`mprintf("%+*s\n", 10, "middle");`|`　　middle　　`|
[文字对齐]

### 格式化输出

|符号|说明|参数|举例|效果|
|:----:|:-----:|-------|:--------|:------|
|**%#M**|居中输出|①：宽度；<br />②：两边字符；<br />③：居中字符串|mprintf("%#M\n", 10, "=", "title");|= title =|
|**%#r**|重复输出|①：重复次数；<br />②：重复的字符串；|mprintf("repeat: %#r.\n", 10, "=");|repeat: ==========.|
|**%#h**|数组|①：每行个数；<br />②：数组；<br />③：数组大小|mprintf("hex array: %#h.\n", <br />　　　4, hex_array, 8);|hex array:<br />0x01 0x02 0x03 0x04<br />0x01 0x02 0x03 0x04|
|**%#P**|名称及值|①：名称；<br />②：格式化字符串；<br />③：值；<br />④：名称；<br />⑤：格式化字符串；<br />⑥：值；<br />....<br />直至==NULL==为止|mprintf(" %#P.\n", <br />　　　"Name", “%s”,"Antonio", <br />　　　"Age", "%d", 27, <br />NULL);|Name = Antonio<br />Age = 27|
|**%#T**|时间|①：格式化时间字符；|mprintf("time: %#T.\n", <br />　　　"%y-%M-%D");|time: 2017-03-04|
|**%@P**|进程ID|无参数|mprintf("%@P\n");|23934|
|**%@T**|线程ID|无参数|mprintf("%@T\n");|12452|
|**%@t**|当前时间|无参数|mprintf("%@t\n");|2017-03-04 16:51:02|
|**%@p**|系统名称|无参数|mprintf("%@p\n");|Windows 7|
[格式化输出]

## 返回值

　　成功，返回输出字符个数；失败，返回-1；
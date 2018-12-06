#!/usr/bin/env bash

grep: 文本过滤器
    grep  pattern input_file
sed: 流编辑器
awk: 报告生成器

gawk: linux版本
awk [options] 'script' file1 file2 ...
awk [options] 'pattern { action }' file1 file2 ...

awk:
-F 指定分隔符

print :
可插入字串，双引号
支持变量：
内置变量：
FS  指定输入的分隔符空白字符
OFS 指定输出分隔符
RS 定义换行符

数据变量：
NR   处理过的行数
FNR 当前文件处理到的行数
NF   当前正在处理的行的字段数

自定义变量
-v  变量名=“变量值”

printf:
printf  format, item1,item2, ..
需要指定format
format 用于指定后面的每个item的输出格式
printf 不会自动换行

pattern


$awk -F : '{printf "%5d", $3}' /etc/passwd
    0    1    2    3    4    5    6    7    8    9   10   13   33   34   38   39   4165534  100  101  102  103  104  105  999  106  998

$awk '{print NF}' test.txt
4
$awk '{print $NF}' test.txt
test.
$awk -v name="black" 'BEGIN{print name}'
black
$awk  'BEGIN{name="black";print name}'
black
$awk -F: '/^r/{print $1}' /etc/passwd
root
$awk -F: '$3>=500{print $1,$3}' /etc/passwd
nobody 65534
admin 999
netdata 998
$awk -F: '$7~"bash$"{print $1,$7}' /etc/passwd
root /bin/bash
admin /bin/bash

$awk -F: ' {i=1;while (i<=NF) {if (length($i) >4) {print $i} i++ }}' /etc/passwd
/root
/bin/bash
daemon
daemon


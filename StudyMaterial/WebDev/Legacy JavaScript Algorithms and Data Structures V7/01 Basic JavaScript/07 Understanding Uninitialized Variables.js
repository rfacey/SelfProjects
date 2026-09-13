/*

Understanding Uninitialized Variables

When JavaScript variables are declared, they have an initial value of undefined. If you do
a methematical operation on an undefined variable your result will be NaN which means
"Not a Number". If you concatenate a string with an undefined variable, you will get a
string of undefined.

*/

var a;

a = a + "String";

console.log(a);
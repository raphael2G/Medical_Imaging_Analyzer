 Ù
úÊ
D
AddV2
x"T
y"T
z"T"
Ttype:
2	
^
AssignVariableOp
resource
value"dtype"
dtypetype"
validate_shapebool( 
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
8
Const
output"dtype"
valuetensor"
dtypetype
*
Erf
x"T
y"T"
Ttype:
2
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	

Mean

input"T
reduction_indices"Tidx
output"T"
	keep_dimsbool( " 
Ttype:
2	"
Tidxtype0:
2	

MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool("
allow_missing_filesbool( 
?
Mul
x"T
y"T
z"T"
Ttype:
2	

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype
@
RealDiv
x"T
y"T
z"T"
Ttype:
2	
[
Reshape
tensor"T
shape"Tshape
output"T"	
Ttype"
Tshapetype0:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
.
Rsqrt
x"T
y"T"
Ttype:

2
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
G
SquaredDifference
x"T
y"T
z"T"
Ttype:

2	
Á
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring ¨
@
StaticRegexFullMatch	
input

output
"
patternstring
2
StopGradient

input"T
output"T"	
Ttype
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
<
Sub
x"T
y"T
z"T"
Ttype:
2	

VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 "serve*2.10.02v2.10.0-rc3-6-g359c3cdfc5f8´
p
dense_2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_2/bias
i
 dense_2/bias/Read/ReadVariableOpReadVariableOpdense_2/bias*
_output_shapes
:*
dtype0
y
dense_2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	*
shared_namedense_2/kernel
r
"dense_2/kernel/Read/ReadVariableOpReadVariableOpdense_2/kernel*
_output_shapes
:	*
dtype0
q
dense_1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namedense_1/bias
j
 dense_1/bias/Read/ReadVariableOpReadVariableOpdense_1/bias*
_output_shapes	
:*
dtype0
z
dense_1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:
*
shared_namedense_1/kernel
s
"dense_1/kernel/Read/ReadVariableOpReadVariableOpdense_1/kernel* 
_output_shapes
:
*
dtype0

layer_normalization/betaVarHandleOp*
_output_shapes
: *
dtype0*
shape:*)
shared_namelayer_normalization/beta

,layer_normalization/beta/Read/ReadVariableOpReadVariableOplayer_normalization/beta*
_output_shapes
:*
dtype0

layer_normalization/gammaVarHandleOp*
_output_shapes
: *
dtype0*
shape:**
shared_namelayer_normalization/gamma

-layer_normalization/gamma/Read/ReadVariableOpReadVariableOplayer_normalization/gamma*
_output_shapes
:*
dtype0

serving_default_MLP_Head_InputPlaceholder*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
dtype0* 
shape:ÿÿÿÿÿÿÿÿÿ1
´
StatefulPartitionedCallStatefulPartitionedCallserving_default_MLP_Head_Inputlayer_normalization/gammalayer_normalization/betadense_1/kerneldense_1/biasdense_2/kerneldense_2/bias*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *+
f&R$
"__inference_signature_wrapper_7530

NoOpNoOp
Ö&
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*&
value&B& Bý%
Ù
layer_with_weights-0
layer-0
layer-1
layer-2
layer_with_weights-1
layer-3
layer-4
layer_with_weights-2
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures*
¯
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
axis
	gamma
beta*

	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses* 
¥
	variables
trainable_variables
 regularization_losses
!	keras_api
"__call__
*#&call_and_return_all_conditional_losses
$_random_generator* 
¦
%	variables
&trainable_variables
'regularization_losses
(	keras_api
)__call__
**&call_and_return_all_conditional_losses

+kernel
,bias*
¥
-	variables
.trainable_variables
/regularization_losses
0	keras_api
1__call__
*2&call_and_return_all_conditional_losses
3_random_generator* 
¦
4	variables
5trainable_variables
6regularization_losses
7	keras_api
8__call__
*9&call_and_return_all_conditional_losses

:kernel
;bias*
.
0
1
+2
,3
:4
;5*
.
0
1
+2
,3
:4
;5*
* 
°
<non_trainable_variables

=layers
>metrics
?layer_regularization_losses
@layer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*
6
Atrace_0
Btrace_1
Ctrace_2
Dtrace_3* 
6
Etrace_0
Ftrace_1
Gtrace_2
Htrace_3* 
* 

Iserving_default* 

0
1*

0
1*
* 

Jnon_trainable_variables

Klayers
Lmetrics
Mlayer_regularization_losses
Nlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses*

Otrace_0* 

Ptrace_0* 
* 
hb
VARIABLE_VALUElayer_normalization/gamma5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUE*
f`
VARIABLE_VALUElayer_normalization/beta4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 

Qnon_trainable_variables

Rlayers
Smetrics
Tlayer_regularization_losses
Ulayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses* 

Vtrace_0* 

Wtrace_0* 
* 
* 
* 

Xnon_trainable_variables

Ylayers
Zmetrics
[layer_regularization_losses
\layer_metrics
	variables
trainable_variables
 regularization_losses
"__call__
*#&call_and_return_all_conditional_losses
&#"call_and_return_conditional_losses* 

]trace_0
^trace_1* 

_trace_0
`trace_1* 
* 

+0
,1*

+0
,1*
* 

anon_trainable_variables

blayers
cmetrics
dlayer_regularization_losses
elayer_metrics
%	variables
&trainable_variables
'regularization_losses
)__call__
**&call_and_return_all_conditional_losses
&*"call_and_return_conditional_losses*

ftrace_0* 

gtrace_0* 
^X
VARIABLE_VALUEdense_1/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_1/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
* 
* 

hnon_trainable_variables

ilayers
jmetrics
klayer_regularization_losses
llayer_metrics
-	variables
.trainable_variables
/regularization_losses
1__call__
*2&call_and_return_all_conditional_losses
&2"call_and_return_conditional_losses* 

mtrace_0
ntrace_1* 

otrace_0
ptrace_1* 
* 

:0
;1*

:0
;1*
* 

qnon_trainable_variables

rlayers
smetrics
tlayer_regularization_losses
ulayer_metrics
4	variables
5trainable_variables
6regularization_losses
8__call__
*9&call_and_return_all_conditional_losses
&9"call_and_return_conditional_losses*

vtrace_0* 

wtrace_0* 
^X
VARIABLE_VALUEdense_2/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE*
ZT
VARIABLE_VALUEdense_2/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE*
* 
.
0
1
2
3
4
5*
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
* 
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 

StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename-layer_normalization/gamma/Read/ReadVariableOp,layer_normalization/beta/Read/ReadVariableOp"dense_1/kernel/Read/ReadVariableOp dense_1/bias/Read/ReadVariableOp"dense_2/kernel/Read/ReadVariableOp dense_2/bias/Read/ReadVariableOpConst*
Tin

2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *&
f!R
__inference__traced_save_7853

StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamelayer_normalization/gammalayer_normalization/betadense_1/kerneldense_1/biasdense_2/kerneldense_2/bias*
Tin
	2*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *)
f$R"
 __inference__traced_restore_7881×ß

D
(__inference_dropout_1_layer_call_fn_7771

inputs
identity¯
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_7278a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
÷	
`
A__inference_dropout_layer_call_and_return_conditional_losses_7739

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?§
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
õD
¹
B__inference_MLP_head_layer_call_and_return_conditional_losses_7670

inputsG
9layer_normalization_batchnorm_mul_readvariableop_resource:C
5layer_normalization_batchnorm_readvariableop_resource::
&dense_1_matmul_readvariableop_resource:
6
'dense_1_biasadd_readvariableop_resource:	9
&dense_2_matmul_readvariableop_resource:	5
'dense_2_biasadd_readvariableop_resource:
identity¢dense_1/BiasAdd/ReadVariableOp¢dense_1/MatMul/ReadVariableOp¢dense_2/BiasAdd/ReadVariableOp¢dense_2/MatMul/ReadVariableOp¢,layer_normalization/batchnorm/ReadVariableOp¢0layer_normalization/batchnorm/mul/ReadVariableOp|
2layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:´
 layer_normalization/moments/meanMeaninputs;layer_normalization/moments/mean/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(
(layer_normalization/moments/StopGradientStopGradient)layer_normalization/moments/mean:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1³
-layer_normalization/moments/SquaredDifferenceSquaredDifferenceinputs1layer_normalization/moments/StopGradient:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
6layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:ç
$layer_normalization/moments/varianceMean1layer_normalization/moments/SquaredDifference:z:0?layer_normalization/moments/variance/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(h
#layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *½75½
!layer_normalization/batchnorm/addAddV2-layer_normalization/moments/variance:output:0,layer_normalization/batchnorm/add/y:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
#layer_normalization/batchnorm/RsqrtRsqrt%layer_normalization/batchnorm/add:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1¦
0layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Á
!layer_normalization/batchnorm/mulMul'layer_normalization/batchnorm/Rsqrt:y:08layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
#layer_normalization/batchnorm/mul_1Mulinputs%layer_normalization/batchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1²
#layer_normalization/batchnorm/mul_2Mul)layer_normalization/moments/mean:output:0%layer_normalization/batchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
,layer_normalization/batchnorm/ReadVariableOpReadVariableOp5layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0½
!layer_normalization/batchnorm/subSub4layer_normalization/batchnorm/ReadVariableOp:value:0'layer_normalization/batchnorm/mul_2:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1²
#layer_normalization/batchnorm/add_1AddV2'layer_normalization/batchnorm/mul_1:z:0%layer_normalization/batchnorm/sub:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ  
flatten/ReshapeReshape'layer_normalization/batchnorm/add_1:z:0flatten/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @
dropout/dropout/MulMulflatten/Reshape:output:0dropout/dropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
dropout/dropout/ShapeShapeflatten/Reshape:output:0*
T0*
_output_shapes
:
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0c
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?¿
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
dense_1/MatMulMatMuldropout/dropout/Mul_1:z:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dense_1/Gelu/mulMuldense_1/Gelu/mul/x:output:0dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿX
dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *óµ?
dense_1/Gelu/truedivRealDivdense_1/BiasAdd:output:0dense_1/Gelu/Cast/x:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
dense_1/Gelu/ErfErfdense_1/Gelu/truediv:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dense_1/Gelu/addAddV2dense_1/Gelu/add/x:output:0dense_1/Gelu/Erf:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
dense_1/Gelu/mul_1Muldense_1/Gelu/mul:z:0dense_1/Gelu/add:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\
dropout_1/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @
dropout_1/dropout/MulMuldense_1/Gelu/mul_1:z:0 dropout_1/dropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ]
dropout_1/dropout/ShapeShapedense_1/Gelu/mul_1:z:0*
T0*
_output_shapes
:¡
.dropout_1/dropout/random_uniform/RandomUniformRandomUniform dropout_1/dropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0e
 dropout_1/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?Å
dropout_1/dropout/GreaterEqualGreaterEqual7dropout_1/dropout/random_uniform/RandomUniform:output:0)dropout_1/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout_1/dropout/CastCast"dropout_1/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dropout_1/dropout/Mul_1Muldropout_1/dropout/Mul:z:0dropout_1/dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
dense_2/MatMulMatMuldropout_1/dropout/Mul_1:z:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿg
IdentityIdentitydense_2/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿª
NoOpNoOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp-^layer_normalization/batchnorm/ReadVariableOp1^layer_normalization/batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2\
,layer_normalization/batchnorm/ReadVariableOp,layer_normalization/batchnorm/ReadVariableOp2d
0layer_normalization/batchnorm/mul/ReadVariableOp0layer_normalization/batchnorm/mul/ReadVariableOp:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
6
¹
B__inference_MLP_head_layer_call_and_return_conditional_losses_7610

inputsG
9layer_normalization_batchnorm_mul_readvariableop_resource:C
5layer_normalization_batchnorm_readvariableop_resource::
&dense_1_matmul_readvariableop_resource:
6
'dense_1_biasadd_readvariableop_resource:	9
&dense_2_matmul_readvariableop_resource:	5
'dense_2_biasadd_readvariableop_resource:
identity¢dense_1/BiasAdd/ReadVariableOp¢dense_1/MatMul/ReadVariableOp¢dense_2/BiasAdd/ReadVariableOp¢dense_2/MatMul/ReadVariableOp¢,layer_normalization/batchnorm/ReadVariableOp¢0layer_normalization/batchnorm/mul/ReadVariableOp|
2layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:´
 layer_normalization/moments/meanMeaninputs;layer_normalization/moments/mean/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(
(layer_normalization/moments/StopGradientStopGradient)layer_normalization/moments/mean:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1³
-layer_normalization/moments/SquaredDifferenceSquaredDifferenceinputs1layer_normalization/moments/StopGradient:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
6layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:ç
$layer_normalization/moments/varianceMean1layer_normalization/moments/SquaredDifference:z:0?layer_normalization/moments/variance/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(h
#layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *½75½
!layer_normalization/batchnorm/addAddV2-layer_normalization/moments/variance:output:0,layer_normalization/batchnorm/add/y:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
#layer_normalization/batchnorm/RsqrtRsqrt%layer_normalization/batchnorm/add:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1¦
0layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOp9layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Á
!layer_normalization/batchnorm/mulMul'layer_normalization/batchnorm/Rsqrt:y:08layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
#layer_normalization/batchnorm/mul_1Mulinputs%layer_normalization/batchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1²
#layer_normalization/batchnorm/mul_2Mul)layer_normalization/moments/mean:output:0%layer_normalization/batchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
,layer_normalization/batchnorm/ReadVariableOpReadVariableOp5layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0½
!layer_normalization/batchnorm/subSub4layer_normalization/batchnorm/ReadVariableOp:value:0'layer_normalization/batchnorm/mul_2:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1²
#layer_normalization/batchnorm/add_1AddV2'layer_normalization/batchnorm/mul_1:z:0%layer_normalization/batchnorm/sub:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1^
flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ  
flatten/ReshapeReshape'layer_normalization/batchnorm/add_1:z:0flatten/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
dropout/IdentityIdentityflatten/Reshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_1/MatMul/ReadVariableOpReadVariableOp&dense_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0
dense_1/MatMulMatMuldropout/Identity:output:0%dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_1/BiasAdd/ReadVariableOpReadVariableOp'dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0
dense_1/BiasAddBiasAdddense_1/MatMul:product:0&dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
dense_1/Gelu/mulMuldense_1/Gelu/mul/x:output:0dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿX
dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *óµ?
dense_1/Gelu/truedivRealDivdense_1/BiasAdd:output:0dense_1/Gelu/Cast/x:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿd
dense_1/Gelu/ErfErfdense_1/Gelu/truediv:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿW
dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
dense_1/Gelu/addAddV2dense_1/Gelu/add/x:output:0dense_1/Gelu/Erf:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿx
dense_1/Gelu/mul_1Muldense_1/Gelu/mul:z:0dense_1/Gelu/add:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿi
dropout_1/IdentityIdentitydense_1/Gelu/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_2/MatMul/ReadVariableOpReadVariableOp&dense_2_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0
dense_2/MatMulMatMuldropout_1/Identity:output:0%dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
dense_2/BiasAdd/ReadVariableOpReadVariableOp'dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0
dense_2/BiasAddBiasAdddense_2/MatMul:product:0&dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿg
IdentityIdentitydense_2/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿª
NoOpNoOp^dense_1/BiasAdd/ReadVariableOp^dense_1/MatMul/ReadVariableOp^dense_2/BiasAdd/ReadVariableOp^dense_2/MatMul/ReadVariableOp-^layer_normalization/batchnorm/ReadVariableOp1^layer_normalization/batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 2@
dense_1/BiasAdd/ReadVariableOpdense_1/BiasAdd/ReadVariableOp2>
dense_1/MatMul/ReadVariableOpdense_1/MatMul/ReadVariableOp2@
dense_2/BiasAdd/ReadVariableOpdense_2/BiasAdd/ReadVariableOp2>
dense_2/MatMul/ReadVariableOpdense_2/MatMul/ReadVariableOp2\
,layer_normalization/batchnorm/ReadVariableOp,layer_normalization/batchnorm/ReadVariableOp2d
0layer_normalization/batchnorm/mul/ReadVariableOp0layer_normalization/batchnorm/mul/ReadVariableOp:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
»
]
A__inference_flatten_layer_call_and_return_conditional_losses_7712

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:ÿÿÿÿÿÿÿÿÿ1:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
ù	
b
C__inference_dropout_1_layer_call_and_return_conditional_losses_7342

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?§
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Á
õ
A__inference_dense_1_layer_call_and_return_conditional_losses_7267

inputs2
matmul_readvariableop_resource:
.
biasadd_readvariableop_resource:	
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?i
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *óµ?r
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿT
Gelu/ErfErfGelu/truediv:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¶
å
B__inference_MLP_head_layer_call_and_return_conditional_losses_7435

inputs&
layer_normalization_7416:&
layer_normalization_7418: 
dense_1_7423:

dense_1_7425:	
dense_2_7429:	
dense_2_7431:
identity¢dense_1/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dropout/StatefulPartitionedCall¢!dropout_1/StatefulPartitionedCall¢+layer_normalization/StatefulPartitionedCall
+layer_normalization/StatefulPartitionedCallStatefulPartitionedCallinputslayer_normalization_7416layer_normalization_7418*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_layer_normalization_layer_call_and_return_conditional_losses_7228ã
flatten/PartitionedCallPartitionedCall4layer_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_flatten_layer_call_and_return_conditional_losses_7240ß
dropout/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_7375
dense_1/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0dense_1_7423dense_1_7425*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_7267
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0 ^dropout/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_7342
dense_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense_2_7429dense_2_7431*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_7290w
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿþ
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dropout/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall,^layer_normalization/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2Z
+layer_normalization/StatefulPartitionedCall+layer_normalization/StatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
ø=

__inference__wrapped_model_7199
mlp_head_inputP
Bmlp_head_layer_normalization_batchnorm_mul_readvariableop_resource:L
>mlp_head_layer_normalization_batchnorm_readvariableop_resource:C
/mlp_head_dense_1_matmul_readvariableop_resource:
?
0mlp_head_dense_1_biasadd_readvariableop_resource:	B
/mlp_head_dense_2_matmul_readvariableop_resource:	>
0mlp_head_dense_2_biasadd_readvariableop_resource:
identity¢'MLP_head/dense_1/BiasAdd/ReadVariableOp¢&MLP_head/dense_1/MatMul/ReadVariableOp¢'MLP_head/dense_2/BiasAdd/ReadVariableOp¢&MLP_head/dense_2/MatMul/ReadVariableOp¢5MLP_head/layer_normalization/batchnorm/ReadVariableOp¢9MLP_head/layer_normalization/batchnorm/mul/ReadVariableOp
;MLP_head/layer_normalization/moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:Î
)MLP_head/layer_normalization/moments/meanMeanmlp_head_inputDMLP_head/layer_normalization/moments/mean/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(«
1MLP_head/layer_normalization/moments/StopGradientStopGradient2MLP_head/layer_normalization/moments/mean:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1Í
6MLP_head/layer_normalization/moments/SquaredDifferenceSquaredDifferencemlp_head_input:MLP_head/layer_normalization/moments/StopGradient:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
?MLP_head/layer_normalization/moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
-MLP_head/layer_normalization/moments/varianceMean:MLP_head/layer_normalization/moments/SquaredDifference:z:0HMLP_head/layer_normalization/moments/variance/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(q
,MLP_head/layer_normalization/batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *½75Ø
*MLP_head/layer_normalization/batchnorm/addAddV26MLP_head/layer_normalization/moments/variance:output:05MLP_head/layer_normalization/batchnorm/add/y:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
,MLP_head/layer_normalization/batchnorm/RsqrtRsqrt.MLP_head/layer_normalization/batchnorm/add:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1¸
9MLP_head/layer_normalization/batchnorm/mul/ReadVariableOpReadVariableOpBmlp_head_layer_normalization_batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0Ü
*MLP_head/layer_normalization/batchnorm/mulMul0MLP_head/layer_normalization/batchnorm/Rsqrt:y:0AMLP_head/layer_normalization/batchnorm/mul/ReadVariableOp:value:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1©
,MLP_head/layer_normalization/batchnorm/mul_1Mulmlp_head_input.MLP_head/layer_normalization/batchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1Í
,MLP_head/layer_normalization/batchnorm/mul_2Mul2MLP_head/layer_normalization/moments/mean:output:0.MLP_head/layer_normalization/batchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1°
5MLP_head/layer_normalization/batchnorm/ReadVariableOpReadVariableOp>mlp_head_layer_normalization_batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0Ø
*MLP_head/layer_normalization/batchnorm/subSub=MLP_head/layer_normalization/batchnorm/ReadVariableOp:value:00MLP_head/layer_normalization/batchnorm/mul_2:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1Í
,MLP_head/layer_normalization/batchnorm/add_1AddV20MLP_head/layer_normalization/batchnorm/mul_1:z:0.MLP_head/layer_normalization/batchnorm/sub:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1g
MLP_head/flatten/ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ  ©
MLP_head/flatten/ReshapeReshape0MLP_head/layer_normalization/batchnorm/add_1:z:0MLP_head/flatten/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
MLP_head/dropout/IdentityIdentity!MLP_head/flatten/Reshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&MLP_head/dense_1/MatMul/ReadVariableOpReadVariableOp/mlp_head_dense_1_matmul_readvariableop_resource* 
_output_shapes
:
*
dtype0¨
MLP_head/dense_1/MatMulMatMul"MLP_head/dropout/Identity:output:0.MLP_head/dense_1/MatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
'MLP_head/dense_1/BiasAdd/ReadVariableOpReadVariableOp0mlp_head_dense_1_biasadd_readvariableop_resource*
_output_shapes	
:*
dtype0ª
MLP_head/dense_1/BiasAddBiasAdd!MLP_head/dense_1/MatMul:product:0/MLP_head/dense_1/BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
MLP_head/dense_1/Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?
MLP_head/dense_1/Gelu/mulMul$MLP_head/dense_1/Gelu/mul/x:output:0!MLP_head/dense_1/BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿa
MLP_head/dense_1/Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *óµ?¥
MLP_head/dense_1/Gelu/truedivRealDiv!MLP_head/dense_1/BiasAdd:output:0%MLP_head/dense_1/Gelu/Cast/x:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿv
MLP_head/dense_1/Gelu/ErfErf!MLP_head/dense_1/Gelu/truediv:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
MLP_head/dense_1/Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?
MLP_head/dense_1/Gelu/addAddV2$MLP_head/dense_1/Gelu/add/x:output:0MLP_head/dense_1/Gelu/Erf:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
MLP_head/dense_1/Gelu/mul_1MulMLP_head/dense_1/Gelu/mul:z:0MLP_head/dense_1/Gelu/add:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ{
MLP_head/dropout_1/IdentityIdentityMLP_head/dense_1/Gelu/mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
&MLP_head/dense_2/MatMul/ReadVariableOpReadVariableOp/mlp_head_dense_2_matmul_readvariableop_resource*
_output_shapes
:	*
dtype0©
MLP_head/dense_2/MatMulMatMul$MLP_head/dropout_1/Identity:output:0.MLP_head/dense_2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
'MLP_head/dense_2/BiasAdd/ReadVariableOpReadVariableOp0mlp_head_dense_2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype0©
MLP_head/dense_2/BiasAddBiasAdd!MLP_head/dense_2/MatMul:product:0/MLP_head/dense_2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
IdentityIdentity!MLP_head/dense_2/BiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿà
NoOpNoOp(^MLP_head/dense_1/BiasAdd/ReadVariableOp'^MLP_head/dense_1/MatMul/ReadVariableOp(^MLP_head/dense_2/BiasAdd/ReadVariableOp'^MLP_head/dense_2/MatMul/ReadVariableOp6^MLP_head/layer_normalization/batchnorm/ReadVariableOp:^MLP_head/layer_normalization/batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 2R
'MLP_head/dense_1/BiasAdd/ReadVariableOp'MLP_head/dense_1/BiasAdd/ReadVariableOp2P
&MLP_head/dense_1/MatMul/ReadVariableOp&MLP_head/dense_1/MatMul/ReadVariableOp2R
'MLP_head/dense_2/BiasAdd/ReadVariableOp'MLP_head/dense_2/BiasAdd/ReadVariableOp2P
&MLP_head/dense_2/MatMul/ReadVariableOp&MLP_head/dense_2/MatMul/ReadVariableOp2n
5MLP_head/layer_normalization/batchnorm/ReadVariableOp5MLP_head/layer_normalization/batchnorm/ReadVariableOp2v
9MLP_head/layer_normalization/batchnorm/mul/ReadVariableOp9MLP_head/layer_normalization/batchnorm/mul/ReadVariableOp:[ W
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
(
_user_specified_nameMLP_Head_Input
Ã

&__inference_dense_1_layer_call_fn_7748

inputs
unknown:

	unknown_0:	
identity¢StatefulPartitionedCall×
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_7267p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
÷	
`
A__inference_dropout_layer_call_and_return_conditional_losses_7375

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?§
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ä
§
B__inference_MLP_head_layer_call_and_return_conditional_losses_7489
mlp_head_input&
layer_normalization_7470:&
layer_normalization_7472: 
dense_1_7477:

dense_1_7479:	
dense_2_7483:	
dense_2_7485:
identity¢dense_1/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢+layer_normalization/StatefulPartitionedCall¢
+layer_normalization/StatefulPartitionedCallStatefulPartitionedCallmlp_head_inputlayer_normalization_7470layer_normalization_7472*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_layer_normalization_layer_call_and_return_conditional_losses_7228ã
flatten/PartitionedCallPartitionedCall4layer_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_flatten_layer_call_and_return_conditional_losses_7240Ï
dropout/PartitionedCallPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_7247
dense_1/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0dense_1_7477dense_1_7479*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_7267Û
dropout_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_7278
dense_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense_2_7483dense_2_7485*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_7290w
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¸
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall,^layer_normalization/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2Z
+layer_normalization/StatefulPartitionedCall+layer_normalization/StatefulPartitionedCall:[ W
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
(
_user_specified_nameMLP_Head_Input
ù	
b
C__inference_dropout_1_layer_call_and_return_conditional_losses_7793

inputs
identityR
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @e
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿC
dropout/ShapeShapeinputs*
T0*
_output_shapes
:
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*
dtype0[
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?§
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿp
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿj
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿZ
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
È	
ó
A__inference_dense_2_layer_call_and_return_conditional_losses_7812

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¿

&__inference_dense_2_layer_call_fn_7802

inputs
unknown:	
	unknown_0:
identity¢StatefulPartitionedCallÖ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_7290o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Ì

B__inference_MLP_head_layer_call_and_return_conditional_losses_7297

inputs&
layer_normalization_7229:&
layer_normalization_7231: 
dense_1_7268:

dense_1_7270:	
dense_2_7291:	
dense_2_7293:
identity¢dense_1/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢+layer_normalization/StatefulPartitionedCall
+layer_normalization/StatefulPartitionedCallStatefulPartitionedCallinputslayer_normalization_7229layer_normalization_7231*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_layer_normalization_layer_call_and_return_conditional_losses_7228ã
flatten/PartitionedCallPartitionedCall4layer_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_flatten_layer_call_and_return_conditional_losses_7240Ï
dropout/PartitionedCallPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_7247
dense_1/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0dense_1_7268dense_1_7270*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_7267Û
dropout_1/PartitionedCallPartitionedCall(dense_1/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_7278
dense_2/StatefulPartitionedCallStatefulPartitionedCall"dropout_1/PartitionedCall:output:0dense_2_7291dense_2_7293*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_7290w
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ¸
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall,^layer_normalization/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2Z
+layer_normalization/StatefulPartitionedCall+layer_normalization/StatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
Ú
a
C__inference_dropout_1_layer_call_and_return_conditional_losses_7278

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
¡
B
&__inference_flatten_layer_call_fn_7706

inputs
identity­
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_flatten_layer_call_and_return_conditional_losses_7240a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:ÿÿÿÿÿÿÿÿÿ1:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
ñ
a
(__inference_dropout_1_layer_call_fn_7776

inputs
identity¢StatefulPartitionedCall¿
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_7342p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
î

'__inference_MLP_head_layer_call_fn_7564

inputs
unknown:
	unknown_0:
	unknown_1:

	unknown_2:	
	unknown_3:	
	unknown_4:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_MLP_head_layer_call_and_return_conditional_losses_7435o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
Ø
_
A__inference_dropout_layer_call_and_return_conditional_losses_7247

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
»
]
A__inference_flatten_layer_call_and_return_conditional_losses_7240

inputs
identityV
ConstConst*
_output_shapes
:*
dtype0*
valueB"ÿÿÿÿ  ]
ReshapeReshapeinputsConst:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿY
IdentityIdentityReshape:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:ÿÿÿÿÿÿÿÿÿ1:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
í
_
&__inference_dropout_layer_call_fn_7722

inputs
identity¢StatefulPartitionedCall½
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_7375p
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
Á
õ
A__inference_dense_1_layer_call_and_return_conditional_losses_7766

inputs2
matmul_readvariableop_resource:
.
biasadd_readvariableop_resource:	
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpv
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource* 
_output_shapes
:
*
dtype0j
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿs
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes	
:*
dtype0w
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿO

Gelu/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *   ?i
Gelu/mulMulGelu/mul/x:output:0BiasAdd:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿP
Gelu/Cast/xConst*
_output_shapes
: *
dtype0*
valueB
 *óµ?r
Gelu/truedivRealDivBiasAdd:output:0Gelu/Cast/x:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿT
Gelu/ErfErfGelu/truediv:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿO

Gelu/add/xConst*
_output_shapes
: *
dtype0*
valueB
 *  ?g
Gelu/addAddV2Gelu/add/x:output:0Gelu/Erf:y:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`

Gelu/mul_1MulGelu/mul:z:0Gelu/add:z:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ^
IdentityIdentityGelu/mul_1:z:0^NoOp*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
È	
ó
A__inference_dense_2_layer_call_and_return_conditional_losses_7290

inputs1
matmul_readvariableop_resource:	-
biasadd_readvariableop_resource:
identity¢BiasAdd/ReadVariableOp¢MatMul/ReadVariableOpu
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	*
dtype0i
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿr
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype0v
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ_
IdentityIdentityBiasAdd:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿw
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:ÿÿÿÿÿÿÿÿÿ: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs


 __inference__traced_restore_7881
file_prefix8
*assignvariableop_layer_normalization_gamma:9
+assignvariableop_1_layer_normalization_beta:5
!assignvariableop_2_dense_1_kernel:
.
assignvariableop_3_dense_1_bias:	4
!assignvariableop_4_dense_2_kernel:	-
assignvariableop_5_dense_2_bias:

identity_7¢AssignVariableOp¢AssignVariableOp_1¢AssignVariableOp_2¢AssignVariableOp_3¢AssignVariableOp_4¢AssignVariableOp_5Ö
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*ü
valueòBïB5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH~
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*!
valueBB B B B B B B Á
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*0
_output_shapes
:::::::*
dtypes
	2[
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOpAssignVariableOp*assignvariableop_layer_normalization_gammaIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_1AssignVariableOp+assignvariableop_1_layer_normalization_betaIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_2AssignVariableOp!assignvariableop_2_dense_1_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_3AssignVariableOpassignvariableop_3_dense_1_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_4AssignVariableOp!assignvariableop_4_dense_2_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype0]

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:
AssignVariableOp_5AssignVariableOpassignvariableop_5_dense_2_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype01
NoOpNoOp"/device:CPU:0*
_output_shapes
 Ö

Identity_6Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5^NoOp"/device:CPU:0*
T0*
_output_shapes
: U

Identity_7IdentityIdentity_6:output:0^NoOp_1*
T0*
_output_shapes
: Ä
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_2^AssignVariableOp_3^AssignVariableOp_4^AssignVariableOp_5*"
_acd_function_control_output(*
_output_shapes
 "!

identity_7Identity_7:output:0*!
_input_shapes
: : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12(
AssignVariableOp_2AssignVariableOp_22(
AssignVariableOp_3AssignVariableOp_32(
AssignVariableOp_4AssignVariableOp_42(
AssignVariableOp_5AssignVariableOp_5:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
ì

M__inference_layer_normalization_layer_call_and_return_conditional_losses_7228

inputs3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identity¢batchnorm/ReadVariableOp¢batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(q
moments/StopGradientStopGradientmoments/mean:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:«
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *½75
batchnorm/addAddV2moments/variance:output:0batchnorm/add/y:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1a
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1g
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1v
batchnorm/mul_2Mulmoments/mean:output:0batchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1v
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1f
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ1: : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs

B
&__inference_dropout_layer_call_fn_7717

inputs
identity­
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_7247a
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
	

'__inference_MLP_head_layer_call_fn_7312
mlp_head_input
unknown:
	unknown_0:
	unknown_1:

	unknown_2:	
	unknown_3:	
	unknown_4:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallmlp_head_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_MLP_head_layer_call_and_return_conditional_losses_7297o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
(
_user_specified_nameMLP_Head_Input
Þ

"__inference_signature_wrapper_7530
mlp_head_input
unknown:
	unknown_0:
	unknown_1:

	unknown_2:	
	unknown_3:	
	unknown_4:
identity¢StatefulPartitionedCallð
StatefulPartitionedCallStatefulPartitionedCallmlp_head_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *(
f#R!
__inference__wrapped_model_7199o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
(
_user_specified_nameMLP_Head_Input
±

__inference__traced_save_7853
file_prefix8
4savev2_layer_normalization_gamma_read_readvariableop7
3savev2_layer_normalization_beta_read_readvariableop-
)savev2_dense_1_kernel_read_readvariableop+
'savev2_dense_1_bias_read_readvariableop-
)savev2_dense_2_kernel_read_readvariableop+
'savev2_dense_2_bias_read_readvariableop
savev2_const

identity_1¢MergeV2Checkpointsw
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*Z
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.parta
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: f

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: L

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :f
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: Ó
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:*
dtype0*ü
valueòBïB5layer_with_weights-0/gamma/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/beta/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH{
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:*
dtype0*!
valueBB B B B B B B É
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:04savev2_layer_normalization_gamma_read_readvariableop3savev2_layer_normalization_beta_read_readvariableop)savev2_dense_1_kernel_read_readvariableop'savev2_dense_1_bias_read_readvariableop)savev2_dense_2_kernel_read_readvariableop'savev2_dense_2_bias_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *
dtypes
	2
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 f
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: Q

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: [
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 "!

identity_1Identity_1:output:0*G
_input_shapes6
4: :::
::	:: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix: 

_output_shapes
:: 

_output_shapes
::&"
 
_output_shapes
:
:!

_output_shapes	
::%!

_output_shapes
:	: 

_output_shapes
::

_output_shapes
: 
Ø
_
A__inference_dropout_layer_call_and_return_conditional_losses_7727

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
î

'__inference_MLP_head_layer_call_fn_7547

inputs
unknown:
	unknown_0:
	unknown_1:

	unknown_2:	
	unknown_3:	
	unknown_4:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_MLP_head_layer_call_and_return_conditional_losses_7297o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
	

'__inference_MLP_head_layer_call_fn_7467
mlp_head_input
unknown:
	unknown_0:
	unknown_1:

	unknown_2:	
	unknown_3:	
	unknown_4:
identity¢StatefulPartitionedCall
StatefulPartitionedCallStatefulPartitionedCallmlp_head_inputunknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4*
Tin
	2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*(
_read_only_resource_inputs

*-
config_proto

CPU

GPU 2J 8 *K
fFRD
B__inference_MLP_head_layer_call_and_return_conditional_losses_7435o
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:[ W
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
(
_user_specified_nameMLP_Head_Input
Î
í
B__inference_MLP_head_layer_call_and_return_conditional_losses_7511
mlp_head_input&
layer_normalization_7492:&
layer_normalization_7494: 
dense_1_7499:

dense_1_7501:	
dense_2_7505:	
dense_2_7507:
identity¢dense_1/StatefulPartitionedCall¢dense_2/StatefulPartitionedCall¢dropout/StatefulPartitionedCall¢!dropout_1/StatefulPartitionedCall¢+layer_normalization/StatefulPartitionedCall¢
+layer_normalization/StatefulPartitionedCallStatefulPartitionedCallmlp_head_inputlayer_normalization_7492layer_normalization_7494*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_layer_normalization_layer_call_and_return_conditional_losses_7228ã
flatten/PartitionedCallPartitionedCall4layer_normalization/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_flatten_layer_call_and_return_conditional_losses_7240ß
dropout/StatefulPartitionedCallStatefulPartitionedCall flatten/PartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dropout_layer_call_and_return_conditional_losses_7375
dense_1/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0dense_1_7499dense_1_7501*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_1_layer_call_and_return_conditional_losses_7267
!dropout_1/StatefulPartitionedCallStatefulPartitionedCall(dense_1/StatefulPartitionedCall:output:0 ^dropout/StatefulPartitionedCall*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8 *L
fGRE
C__inference_dropout_1_layer_call_and_return_conditional_losses_7342
dense_2/StatefulPartitionedCallStatefulPartitionedCall*dropout_1/StatefulPartitionedCall:output:0dense_2_7505dense_2_7507*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:ÿÿÿÿÿÿÿÿÿ*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *J
fERC
A__inference_dense_2_layer_call_and_return_conditional_losses_7290w
IdentityIdentity(dense_2/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:ÿÿÿÿÿÿÿÿÿþ
NoOpNoOp ^dense_1/StatefulPartitionedCall ^dense_2/StatefulPartitionedCall ^dropout/StatefulPartitionedCall"^dropout_1/StatefulPartitionedCall,^layer_normalization/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*6
_input_shapes%
#:ÿÿÿÿÿÿÿÿÿ1: : : : : : 2B
dense_1/StatefulPartitionedCalldense_1/StatefulPartitionedCall2B
dense_2/StatefulPartitionedCalldense_2/StatefulPartitionedCall2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2F
!dropout_1/StatefulPartitionedCall!dropout_1/StatefulPartitionedCall2Z
+layer_normalization/StatefulPartitionedCall+layer_normalization/StatefulPartitionedCall:[ W
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
(
_user_specified_nameMLP_Head_Input
Ú
a
C__inference_dropout_1_layer_call_and_return_conditional_losses_7781

inputs

identity_1O
IdentityIdentityinputs*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ\

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:ÿÿÿÿÿÿÿÿÿ:P L
(
_output_shapes
:ÿÿÿÿÿÿÿÿÿ
 
_user_specified_nameinputs
ì

M__inference_layer_normalization_layer_call_and_return_conditional_losses_7701

inputs3
%batchnorm_mul_readvariableop_resource:/
!batchnorm_readvariableop_resource:
identity¢batchnorm/ReadVariableOp¢batchnorm/mul/ReadVariableOph
moments/mean/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:
moments/meanMeaninputs'moments/mean/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(q
moments/StopGradientStopGradientmoments/mean:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
moments/SquaredDifferenceSquaredDifferenceinputsmoments/StopGradient:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1l
"moments/variance/reduction_indicesConst*
_output_shapes
:*
dtype0*
valueB:«
moments/varianceMeanmoments/SquaredDifference:z:0+moments/variance/reduction_indices:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*
	keep_dims(T
batchnorm/add/yConst*
_output_shapes
: *
dtype0*
valueB
 *½75
batchnorm/addAddV2moments/variance:output:0batchnorm/add/y:output:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1a
batchnorm/RsqrtRsqrtbatchnorm/add:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1~
batchnorm/mul/ReadVariableOpReadVariableOp%batchnorm_mul_readvariableop_resource*
_output_shapes
:*
dtype0
batchnorm/mulMulbatchnorm/Rsqrt:y:0$batchnorm/mul/ReadVariableOp:value:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1g
batchnorm/mul_1Mulinputsbatchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1v
batchnorm/mul_2Mulmoments/mean:output:0batchnorm/mul:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1v
batchnorm/ReadVariableOpReadVariableOp!batchnorm_readvariableop_resource*
_output_shapes
:*
dtype0
batchnorm/subSub batchnorm/ReadVariableOp:value:0batchnorm/mul_2:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1v
batchnorm/add_1AddV2batchnorm/mul_1:z:0batchnorm/sub:z:0*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1f
IdentityIdentitybatchnorm/add_1:z:0^NoOp*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
NoOpNoOp^batchnorm/ReadVariableOp^batchnorm/mul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ1: : 24
batchnorm/ReadVariableOpbatchnorm/ReadVariableOp2<
batchnorm/mul/ReadVariableOpbatchnorm/mul/ReadVariableOp:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs
à

2__inference_layer_normalization_layer_call_fn_7679

inputs
unknown:
	unknown_0:
identity¢StatefulPartitionedCallæ
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8 *V
fQRO
M__inference_layer_normalization_layer_call_and_return_conditional_losses_7228s
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1`
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 "
identityIdentity:output:0*(
_construction_contextkEagerRuntime*.
_input_shapes
:ÿÿÿÿÿÿÿÿÿ1: : 22
StatefulPartitionedCallStatefulPartitionedCall:S O
+
_output_shapes
:ÿÿÿÿÿÿÿÿÿ1
 
_user_specified_nameinputs"µ	L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*¼
serving_default¨
M
MLP_Head_Input;
 serving_default_MLP_Head_Input:0ÿÿÿÿÿÿÿÿÿ1;
dense_20
StatefulPartitionedCall:0ÿÿÿÿÿÿÿÿÿtensorflow/serving/predict:ù¤
ó
layer_with_weights-0
layer-0
layer-1
layer-2
layer_with_weights-1
layer-3
layer-4
layer_with_weights-2
layer-5
	variables
trainable_variables
	regularization_losses

	keras_api
__call__
*&call_and_return_all_conditional_losses
_default_save_signature

signatures"
_tf_keras_sequential
Ä
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses
axis
	gamma
beta"
_tf_keras_layer
¥
	variables
trainable_variables
regularization_losses
	keras_api
__call__
*&call_and_return_all_conditional_losses"
_tf_keras_layer
¼
	variables
trainable_variables
 regularization_losses
!	keras_api
"__call__
*#&call_and_return_all_conditional_losses
$_random_generator"
_tf_keras_layer
»
%	variables
&trainable_variables
'regularization_losses
(	keras_api
)__call__
**&call_and_return_all_conditional_losses

+kernel
,bias"
_tf_keras_layer
¼
-	variables
.trainable_variables
/regularization_losses
0	keras_api
1__call__
*2&call_and_return_all_conditional_losses
3_random_generator"
_tf_keras_layer
»
4	variables
5trainable_variables
6regularization_losses
7	keras_api
8__call__
*9&call_and_return_all_conditional_losses

:kernel
;bias"
_tf_keras_layer
J
0
1
+2
,3
:4
;5"
trackable_list_wrapper
J
0
1
+2
,3
:4
;5"
trackable_list_wrapper
 "
trackable_list_wrapper
Ê
<non_trainable_variables

=layers
>metrics
?layer_regularization_losses
@layer_metrics
	variables
trainable_variables
	regularization_losses
__call__
_default_save_signature
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
Ñ
Atrace_0
Btrace_1
Ctrace_2
Dtrace_32æ
'__inference_MLP_head_layer_call_fn_7312
'__inference_MLP_head_layer_call_fn_7547
'__inference_MLP_head_layer_call_fn_7564
'__inference_MLP_head_layer_call_fn_7467¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zAtrace_0zBtrace_1zCtrace_2zDtrace_3
½
Etrace_0
Ftrace_1
Gtrace_2
Htrace_32Ò
B__inference_MLP_head_layer_call_and_return_conditional_losses_7610
B__inference_MLP_head_layer_call_and_return_conditional_losses_7670
B__inference_MLP_head_layer_call_and_return_conditional_losses_7489
B__inference_MLP_head_layer_call_and_return_conditional_losses_7511¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zEtrace_0zFtrace_1zGtrace_2zHtrace_3
ÑBÎ
__inference__wrapped_model_7199MLP_Head_Input"
²
FullArgSpec
args 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
,
Iserving_default"
signature_map
.
0
1"
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
Jnon_trainable_variables

Klayers
Lmetrics
Mlayer_regularization_losses
Nlayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
ö
Otrace_02Ù
2__inference_layer_normalization_layer_call_fn_7679¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zOtrace_0

Ptrace_02ô
M__inference_layer_normalization_layer_call_and_return_conditional_losses_7701¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zPtrace_0
 "
trackable_list_wrapper
':%2layer_normalization/gamma
&:$2layer_normalization/beta
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
Qnon_trainable_variables

Rlayers
Smetrics
Tlayer_regularization_losses
Ulayer_metrics
	variables
trainable_variables
regularization_losses
__call__
*&call_and_return_all_conditional_losses
&"call_and_return_conditional_losses"
_generic_user_object
ê
Vtrace_02Í
&__inference_flatten_layer_call_fn_7706¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zVtrace_0

Wtrace_02è
A__inference_flatten_layer_call_and_return_conditional_losses_7712¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zWtrace_0
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
Xnon_trainable_variables

Ylayers
Zmetrics
[layer_regularization_losses
\layer_metrics
	variables
trainable_variables
 regularization_losses
"__call__
*#&call_and_return_all_conditional_losses
&#"call_and_return_conditional_losses"
_generic_user_object
½
]trace_0
^trace_12
&__inference_dropout_layer_call_fn_7717
&__inference_dropout_layer_call_fn_7722³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 z]trace_0z^trace_1
ó
_trace_0
`trace_12¼
A__inference_dropout_layer_call_and_return_conditional_losses_7727
A__inference_dropout_layer_call_and_return_conditional_losses_7739³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 z_trace_0z`trace_1
"
_generic_user_object
.
+0
,1"
trackable_list_wrapper
.
+0
,1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
anon_trainable_variables

blayers
cmetrics
dlayer_regularization_losses
elayer_metrics
%	variables
&trainable_variables
'regularization_losses
)__call__
**&call_and_return_all_conditional_losses
&*"call_and_return_conditional_losses"
_generic_user_object
ê
ftrace_02Í
&__inference_dense_1_layer_call_fn_7748¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zftrace_0

gtrace_02è
A__inference_dense_1_layer_call_and_return_conditional_losses_7766¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zgtrace_0
": 
2dense_1/kernel
:2dense_1/bias
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
­
hnon_trainable_variables

ilayers
jmetrics
klayer_regularization_losses
llayer_metrics
-	variables
.trainable_variables
/regularization_losses
1__call__
*2&call_and_return_all_conditional_losses
&2"call_and_return_conditional_losses"
_generic_user_object
Á
mtrace_0
ntrace_12
(__inference_dropout_1_layer_call_fn_7771
(__inference_dropout_1_layer_call_fn_7776³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zmtrace_0zntrace_1
÷
otrace_0
ptrace_12À
C__inference_dropout_1_layer_call_and_return_conditional_losses_7781
C__inference_dropout_1_layer_call_and_return_conditional_losses_7793³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zotrace_0zptrace_1
"
_generic_user_object
.
:0
;1"
trackable_list_wrapper
.
:0
;1"
trackable_list_wrapper
 "
trackable_list_wrapper
­
qnon_trainable_variables

rlayers
smetrics
tlayer_regularization_losses
ulayer_metrics
4	variables
5trainable_variables
6regularization_losses
8__call__
*9&call_and_return_all_conditional_losses
&9"call_and_return_conditional_losses"
_generic_user_object
ê
vtrace_02Í
&__inference_dense_2_layer_call_fn_7802¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zvtrace_0

wtrace_02è
A__inference_dense_2_layer_call_and_return_conditional_losses_7812¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 zwtrace_0
!:	2dense_2/kernel
:2dense_2/bias
 "
trackable_list_wrapper
J
0
1
2
3
4
5"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
Bý
'__inference_MLP_head_layer_call_fn_7312MLP_Head_Input"¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
øBõ
'__inference_MLP_head_layer_call_fn_7547inputs"¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
øBõ
'__inference_MLP_head_layer_call_fn_7564inputs"¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Bý
'__inference_MLP_head_layer_call_fn_7467MLP_Head_Input"¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
B
B__inference_MLP_head_layer_call_and_return_conditional_losses_7610inputs"¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
B
B__inference_MLP_head_layer_call_and_return_conditional_losses_7670inputs"¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
B
B__inference_MLP_head_layer_call_and_return_conditional_losses_7489MLP_Head_Input"¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
B
B__inference_MLP_head_layer_call_and_return_conditional_losses_7511MLP_Head_Input"¿
¶²²
FullArgSpec1
args)&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults
p 

 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ÐBÍ
"__inference_signature_wrapper_7530MLP_Head_Input"
²
FullArgSpec
args 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
æBã
2__inference_layer_normalization_layer_call_fn_7679inputs"¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
Bþ
M__inference_layer_normalization_layer_call_and_return_conditional_losses_7701inputs"¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÚB×
&__inference_flatten_layer_call_fn_7706inputs"¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
õBò
A__inference_flatten_layer_call_and_return_conditional_losses_7712inputs"¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ëBè
&__inference_dropout_layer_call_fn_7717inputs"³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
ëBè
&__inference_dropout_layer_call_fn_7722inputs"³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
B
A__inference_dropout_layer_call_and_return_conditional_losses_7727inputs"³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
B
A__inference_dropout_layer_call_and_return_conditional_losses_7739inputs"³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÚB×
&__inference_dense_1_layer_call_fn_7748inputs"¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
õBò
A__inference_dense_1_layer_call_and_return_conditional_losses_7766inputs"¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
íBê
(__inference_dropout_1_layer_call_fn_7771inputs"³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
íBê
(__inference_dropout_1_layer_call_fn_7776inputs"³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
B
C__inference_dropout_1_layer_call_and_return_conditional_losses_7781inputs"³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
B
C__inference_dropout_1_layer_call_and_return_conditional_losses_7793inputs"³
ª²¦
FullArgSpec)
args!
jself
jinputs

jtraining
varargs
 
varkw
 
defaults
p 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
ÚB×
&__inference_dense_2_layer_call_fn_7802inputs"¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 
õBò
A__inference_dense_2_layer_call_and_return_conditional_losses_7812inputs"¢
²
FullArgSpec
args
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs 
kwonlydefaults
 
annotationsª *
 º
B__inference_MLP_head_layer_call_and_return_conditional_losses_7489t+,:;C¢@
9¢6
,)
MLP_Head_Inputÿÿÿÿÿÿÿÿÿ1
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 º
B__inference_MLP_head_layer_call_and_return_conditional_losses_7511t+,:;C¢@
9¢6
,)
MLP_Head_Inputÿÿÿÿÿÿÿÿÿ1
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 ²
B__inference_MLP_head_layer_call_and_return_conditional_losses_7610l+,:;;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿ1
p 

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 ²
B__inference_MLP_head_layer_call_and_return_conditional_losses_7670l+,:;;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿ1
p

 
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 
'__inference_MLP_head_layer_call_fn_7312g+,:;C¢@
9¢6
,)
MLP_Head_Inputÿÿÿÿÿÿÿÿÿ1
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
'__inference_MLP_head_layer_call_fn_7467g+,:;C¢@
9¢6
,)
MLP_Head_Inputÿÿÿÿÿÿÿÿÿ1
p

 
ª "ÿÿÿÿÿÿÿÿÿ
'__inference_MLP_head_layer_call_fn_7547_+,:;;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿ1
p 

 
ª "ÿÿÿÿÿÿÿÿÿ
'__inference_MLP_head_layer_call_fn_7564_+,:;;¢8
1¢.
$!
inputsÿÿÿÿÿÿÿÿÿ1
p

 
ª "ÿÿÿÿÿÿÿÿÿ
__inference__wrapped_model_7199x+,:;;¢8
1¢.
,)
MLP_Head_Inputÿÿÿÿÿÿÿÿÿ1
ª "1ª.
,
dense_2!
dense_2ÿÿÿÿÿÿÿÿÿ£
A__inference_dense_1_layer_call_and_return_conditional_losses_7766^+,0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 {
&__inference_dense_1_layer_call_fn_7748Q+,0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ¢
A__inference_dense_2_layer_call_and_return_conditional_losses_7812]:;0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "%¢"

0ÿÿÿÿÿÿÿÿÿ
 z
&__inference_dense_2_layer_call_fn_7802P:;0¢-
&¢#
!
inputsÿÿÿÿÿÿÿÿÿ
ª "ÿÿÿÿÿÿÿÿÿ¥
C__inference_dropout_1_layer_call_and_return_conditional_losses_7781^4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 ¥
C__inference_dropout_1_layer_call_and_return_conditional_losses_7793^4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 }
(__inference_dropout_1_layer_call_fn_7771Q4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "ÿÿÿÿÿÿÿÿÿ}
(__inference_dropout_1_layer_call_fn_7776Q4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "ÿÿÿÿÿÿÿÿÿ£
A__inference_dropout_layer_call_and_return_conditional_losses_7727^4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 £
A__inference_dropout_layer_call_and_return_conditional_losses_7739^4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 {
&__inference_dropout_layer_call_fn_7717Q4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p 
ª "ÿÿÿÿÿÿÿÿÿ{
&__inference_dropout_layer_call_fn_7722Q4¢1
*¢'
!
inputsÿÿÿÿÿÿÿÿÿ
p
ª "ÿÿÿÿÿÿÿÿÿ¢
A__inference_flatten_layer_call_and_return_conditional_losses_7712]3¢0
)¢&
$!
inputsÿÿÿÿÿÿÿÿÿ1
ª "&¢#

0ÿÿÿÿÿÿÿÿÿ
 z
&__inference_flatten_layer_call_fn_7706P3¢0
)¢&
$!
inputsÿÿÿÿÿÿÿÿÿ1
ª "ÿÿÿÿÿÿÿÿÿµ
M__inference_layer_normalization_layer_call_and_return_conditional_losses_7701d3¢0
)¢&
$!
inputsÿÿÿÿÿÿÿÿÿ1
ª ")¢&

0ÿÿÿÿÿÿÿÿÿ1
 
2__inference_layer_normalization_layer_call_fn_7679W3¢0
)¢&
$!
inputsÿÿÿÿÿÿÿÿÿ1
ª "ÿÿÿÿÿÿÿÿÿ1±
"__inference_signature_wrapper_7530+,:;M¢J
¢ 
Cª@
>
MLP_Head_Input,)
MLP_Head_Inputÿÿÿÿÿÿÿÿÿ1"1ª.
,
dense_2!
dense_2ÿÿÿÿÿÿÿÿÿ
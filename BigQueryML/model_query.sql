{\rtf1\ansi\ansicpg1252\cocoartf2577
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red39\green78\blue204;\red255\green255\blue254;\red0\green0\blue0;
\red42\green55\blue62;\red107\green0\blue1;\red21\green129\blue62;\red238\green57\blue24;}
{\*\expandedcolortbl;;\cssrgb\c20000\c40392\c83922;\cssrgb\c100000\c100000\c99608;\cssrgb\c0\c0\c0;
\cssrgb\c21569\c27843\c30980;\cssrgb\c50196\c0\c0;\cssrgb\c5098\c56471\c30980;\cssrgb\c95686\c31765\c11765;}
\paperw11900\paperh16840\margl1440\margr1440\vieww21200\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 CREATE\cf4 \strokec4  \cf2 \strokec2 OR\cf4 \strokec4  \cf2 \strokec2 REPLACE\cf4 \strokec4  \cf2 \strokec2 MODEL\cf4 \strokec4  XGBoost_dataset.xgb_model\cb1 \
\cf2 \cb3 \strokec2 OPTIONS\cf5 \strokec5 (\cf6 \strokec6 MODEL_TYPE\cf4 \strokec4 =\cf7 \strokec7 'BOOSTED_TREE_CLASSIFIER'\cf4 \strokec4 ,\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3         \cf6 \strokec6 BOOSTER_TYPE\cf4 \strokec4  = \cf7 \strokec7 'GBTREE'\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 MAX_TREE_DEPTH\cf4 \strokec4 =\cf8 \strokec8 6\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 LEARN_RATE\cf4 \strokec4 =\cf8 \strokec8 0.3\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 MIN_TREE_CHILD_WEIGHT\cf4 \strokec4 =\cf8 \strokec8 5\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 MAX_ITERATIONS\cf4 \strokec4 =\cf8 \strokec8 250\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 EARLY_STOP\cf4 \strokec4  = \cf2 \strokec2 TRUE\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 MIN_REL_PROGRESS\cf4 \strokec4  = \cf8 \strokec8 0.001\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 INPUT_LABEL_COLS\cf4 \strokec4  = \cf5 \strokec5 [\cf7 \strokec7 'income_level'\cf5 \strokec5 ]\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 DATA_SPLIT_COL\cf4 \strokec4 =\cf7 \strokec7 'row_num'\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 DATA_SPLIT_METHOD\cf4 \strokec4 =\cf7 \strokec7 'SEQ'\cf4 \strokec4 ,\cb1 \
\cb3         \cf6 \strokec6 DATA_SPLIT_EVAL_FRACTION\cf4 \strokec4 =\cf8 \strokec8 0.2\cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 )\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 AS\cf4 \strokec4  \cb1 \
\cf2 \cb3 \strokec2 select\cf4 \strokec4  row_num_a \cf2 \strokec2 as\cf4 \strokec4  row_num,\cf5 \strokec5 *\cf4 \strokec4  \cf2 \strokec2 except\cf5 \strokec5 (\cf4 \strokec4 row_num_a,row_num_b,income_level\cf5 \strokec5 )\cf4 \strokec4 ,\cf2 \strokec2 cast\cf5 \strokec5 (\cf4 \strokec4 income_level \cf2 \strokec2 as\cf4 \strokec4  \cf2 \strokec2 string\cf5 \strokec5 )\cf4 \strokec4  \cf2 \strokec2 as\cf4 \strokec4  income_level \cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3     \cf2 \strokec2 from\cf4 \cb1 \strokec4 \
\cb3         \cf5 \strokec5 (\cf2 \strokec2 select\cf4 \strokec4  row_num \cf2 \strokec2 as\cf4 \strokec4  row_num_a, \cf5 \strokec5 *\cf4 \strokec4  \cf2 \strokec2 except\cf5 \strokec5 (\cf4 \strokec4 row_num\cf5 \strokec5 )\cf4 \cb1 \strokec4 \
\cb3         \cf2 \strokec2 from\cf4 \strokec4  \cf7 \strokec7 `hypatai-income-classification.XGBoost_dataset.XGBOOST_X_train`\cf5 \strokec5 )\cf4 \strokec4  x_train\cb1 \
\cb3     \cf2 \strokec2 left\cf4 \strokec4  \cf2 \strokec2 join\cf4 \strokec4  \cb1 \
\cb3         \cf5 \strokec5 (\cf2 \strokec2 select\cf4 \strokec4  row_num \cf2 \strokec2 as\cf4 \strokec4  row_num_b,income_level \cf2 \strokec2 from\cf4 \strokec4  \cf7 \strokec7 `hypatai-income-classification.XGBoost_dataset.XGBOOST_y_train`\cf5 \strokec5 )\cf4 \strokec4  y_train\cb1 \
\cb3     \cf2 \strokec2 on\cf4 \strokec4  x_train.\cf6 \strokec6 row_num_a\cf4 \strokec4 =y_train.row_num_b\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 order\cf4 \strokec4  \cf2 \strokec2 by\cf4 \strokec4  row_num;\cb1 \
}
{\rtf1\ansi\ansicpg1252\cocoartf2577
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red39\green78\blue204;\red255\green255\blue254;\red0\green0\blue0;
\red42\green55\blue62;\red21\green129\blue62;\red238\green57\blue24;}
{\*\expandedcolortbl;;\cssrgb\c20000\c40392\c83922;\cssrgb\c100000\c100000\c99608;\cssrgb\c0\c0\c0;
\cssrgb\c21569\c27843\c30980;\cssrgb\c5098\c56471\c30980;\cssrgb\c95686\c31765\c11765;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11680\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 SELECT\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 *\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   ML.FEATURE_IMPORTANCE\cf5 \strokec5 (\cf2 \strokec2 MODEL\cf4 \strokec4  \cf6 \strokec6 `XGBoost_dataset.xgb_model`\cf5 \strokec5 )\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 order\cf4 \strokec4  \cf2 \strokec2 by\cf4 \strokec4  importance_gain \cf2 \strokec2 desc\cf4 \strokec4 ;\cb1 \
\
\cf2 \cb3 \strokec2 SELECT\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 *\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   ML.EVALUATE\cf5 \strokec5 (\cf2 \strokec2 MODEL\cf4 \strokec4  \cf6 \strokec6 `XGBoost_dataset.xgb_model`\cf4 \strokec4 ,\cb1 \
\cb3     \cf5 \strokec5 (\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 SELECT\cf4 \strokec4  \cf5 \strokec5 *\cf4 \strokec4  \cf2 \strokec2 except\cf5 \strokec5 (\cf4 \strokec4 income_level\cf5 \strokec5 )\cf4 \strokec4 ,\cf2 \strokec2 cast\cf5 \strokec5 (\cf4 \strokec4 income_level \cf2 \strokec2 as\cf4 \strokec4  \cf2 \strokec2 string\cf5 \strokec5 )\cf4 \strokec4  \cf2 \strokec2 as\cf4 \strokec4  income_level \cb1 \
\cb3     \cf2 \strokec2 FROM\cf4 \strokec4  \cf6 \strokec6 `hypatai-income-classification._22d1f95da98e6f0d6a22ed89656a1d54db0e32f6.anon2e037707_6699_4a77_a21a_f573d11ca82d_imported_data_split_eval_data`\cf5 \strokec5 )\cf4 \strokec4  ,\cb1 \
\cb3     \cf2 \strokec2 STRUCT\cf5 \strokec5 (\cf7 \strokec7 0.3039\cf4 \strokec4  \cf2 \strokec2 AS\cf4 \strokec4  threshold\cf5 \strokec5 ))\cf4 \strokec4 ;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 SELECT\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 *\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 FROM\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   ML.ROC_CURVE\cf5 \strokec5 (\cf2 \strokec2 MODEL\cf4 \strokec4  \cf6 \strokec6 `XGBoost_dataset.xgb_model`\cf4 \strokec4 ,\cb1 \
\cb3     \cf5 \strokec5 (\cf4 \cb1 \strokec4 \
\cb3     \cf2 \strokec2 SELECT\cf4 \strokec4  \cf5 \strokec5 *\cf4 \strokec4  \cf2 \strokec2 except\cf5 \strokec5 (\cf4 \strokec4 income_level\cf5 \strokec5 )\cf4 \strokec4 ,\cf2 \strokec2 cast\cf5 \strokec5 (\cf4 \strokec4 income_level \cf2 \strokec2 as\cf4 \strokec4  \cf2 \strokec2 string\cf5 \strokec5 )\cf4 \strokec4  \cf2 \strokec2 as\cf4 \strokec4  income_level \cb1 \
\cb3     \cf2 \strokec2 FROM\cf4 \strokec4  \cf6 \strokec6 `hypatai-income-classification._22d1f95da98e6f0d6a22ed89656a1d54db0e32f6.anon2e037707_6699_4a77_a21a_f573d11ca82d_imported_data_split_eval_data`\cf5 \strokec5 ))\cf4 \strokec4 ;\cb1 \
\
}
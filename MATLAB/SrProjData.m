clear all;
close all;

final = [4876.303	4826.872	5021.725	5153.215	4525.832	4408.489	4542.076	4648.255	14.533	4678.715	4153.985	4424.068
;4926.55	4956.368	5155.071	5317.334	4982.38	4451.126	4303.855	5520.322	13.106	4561.792	5127.698	4239.826
;4661.93	5077.944	5138.393	5315.81	4729.897	4257.565	4597.21	5104.08	13.039	4558	5081.026	4063.639
;4776.854	5009.834	5156.598	5716.636	4932.051	4376.937	4585.502	5034.899	13.138	4772.19	5016.335	4492.486
;4786.648	4842.75	5294.617	5674.479	4897.119	4171.661	4735.253	5615.343	14.921	4415.918	4305.618	11.647
;5306.243	5122.901	5400.067	5807.656	5203.081	4655.372	5121.962	5518.899	12.736	4402.979	4282.029	13.244
;5237.794	5244.171	5625.53	5739.532	5120.568	4963.73	5162.178	5902.37	4421.633	5097.247	4258.895	12.327
;5232.952	5309.58	5333.791	5501.222	4909.791	5229.72	5029.185	5790.459	4375.511	5371.32	4804.603	14.315
];


t3 =  [5718.398	5728.039	5753.841	5915.497	5047.816	5077.719	5987.842	6035.297	23.938	5882.991	5556.142	5576.686
;5914.849	5954.911	6060.125	6062.083	5621.944	5173.816	5470.267	6581.739	21.675	5757.168	6177.354	5592.592
;5726.976	6113.812	6066.778	6090.584	5435.611	5275.463	5835.407	6109.043	23.684	5889.508	6073.363	5549.288
;5625.193	6080.088	6016.378	6390.589	5708.624	5403.101	6067.908	5955.46	25.161	6211.977	6049.725	6067.389
;5599.809	5772.522	6115.887	6286.683	5642.241	5051.525	6045.391	6487.358	25.627	5813.476	5699.311	18.716
;5758.542	5720.73	6280.31	6463.903	6168.294	5488.514	6035.14	6284.287	23.552	6299.01	5367.341	21.425
;5896.949	6088.583	6180.111	6230.975	5966.226	5753.987	6028.347	6547.534	4835.817	6352.024	5469.052	21.771
;5984.522	5990.324	6048.506	6042.364	5735.942	5973.562	5975.901	6390.206	4897.871	6234.376	5616.11	22.436
];
t6 = [5459.49	5455.625	5538.517	5675.438	4834.814	4853.559	5791.365	5754.685	20.645	5613.188	5299.615	5295.752
;5611.355	5668.335	5837.811	5909.303	5502.607	4891.946	5264.257	6420.192	16.995	5511.031	5999.36	5299.953
;5430.546	5854.125	5806.433	5882.874	5317.012	4978.691	5603.154	5951.353	18.4	5666.509	5886.68	5343.496
;5337.572	5763.267	5808.406	6298.251	5527.642	5094.244	5843.371	5807.075	20.483	5990	5914.489	5796.291
;5333.805	5495.56	5891.385	6156.801	5402.346	4862.63	5854.4	6338.27	20.928	5586.405	5487.569	14.743
;5619.302	5509.933	6098.148	6331.674	5921.88	5203.754	5859.542	6183.371	18.107	6020.332	5069.006	17.43
;5732.675	5755.355	6038.589	6054.045	5735.493	5503.3	5819.005	6457.224	4717.218	6169.781	5187.304	16.709
;5760.467	5799.091	5903.519	5896.112	5442.985	5734.564	5735.821	6307.331	4851.47	6092.939	5419.807	17.552
];
t8 = [5236.426	5246.519	5374.779	5536.382	4765.741	4736.585	5548.71	5614.134	17.991	5466.529	5150.85	5055.378
;5371.21	5458.929	5657.842	5741.167	5389.939	4766.802	5059.424	6296.603	16.642	5329.661	5866.105	5046.265
;5209.916	5647.877	5680.012	5742.745	5170.874	4803.746	5480.769	5800.45	17.314	5464.015	5753.385	5068.513
;5136.696	5561.717	5613.376	6115.754	5373.61	4881.343	5609.925	5665.363	19.11	5845.174	5786.296	5577.26
;5105.788	5289.274	5742.336	6045.216	5219.21	4587.882	5698.524	6215.112	19.07	5404.563	5320.598	13.661
;5528.492	5362.863	5971.76	6148.828	5718.03	4962.971	5647.253	6074.506	16.256	5823.31	4857.11	15.808
;5527.176	5580.262	5889.223	5906.409	5564.661	5259.993	5638.899	6309.949	4640.659	6057.669	4956.029	15.153
;5591.003	5624.518	5697.998	5733.164	5251.609	5516.751	5495.854	6197.812	4708.421	5936.024	5266.746	16.603
];
t12 = [5130.108	5029.319	5275.581	5441.259	4754.072	4688.207	5344.949	5399.167	15.715	5225.211	4950.648	4900.591
;5148.794	5176.888	5518.355	5633.952	5339.476	4765.602	4844.444	6080.545	14.154	5076.518	5744.269	4895.397
;4850.926	5490.947	5479.152	5565.011	5093.498	4655.009	5260.18	5648.802	14.575	5207.169	5618.066	4850.563
;4798.569	5312.513	5468.244	6017.835	5304.827	4789.791	5389.833	5520.796	15.541	5559.017	5644.82	5412.433
;4905.158	5080.619	5572.662	5940.528	5107.985	4435.934	5491.203	6152.802	16.8	5185.306	5150.973	11.774
;5404.081	5247.966	5821.466	6059.231	5538.428	4901.956	5617.386	5985.41	14.334	5570.491	4759.934	14.054
;5444.946	5402.031	5844.993	5867.923	5377.104	5170.425	5596.456	6236.232	4516.848	5853.05	4851.461	13.818
;5458.142	5576.968	5652.833	5668.032	5144.292	5448.089	5466.166	6109.742	4608.604	5814.212	5205.636	14.766
];
t16 = [4951.292	5005.944	5122.133	5292.352	4679.168	4537.901	5043.001	5057.673	14.843	4987.929	4665.961	4614.269
;5004.681	5104.642	5423.99	5499.708	5202.716	4616.809	4510.967	5987.532	13.348	4649.503	5565.663	4625.189
;4672.531	5367.401	5431.517	5493.041	4889.907	4383.423	4919.978	5451.565	14.243	4799.136	5482.156	4649.488
;4675.731	5290.112	5327.637	5915.727	5124.833	4364.382	5111.868	5341.592	14.427	5183.788	5487.956	5054.174
;4733.481	5016.904	5421.671	5775.806	5013.997	4169.894	5205.488	5858.67	15.031	4812.572	4874.06	12.288
;5309.347	5200.726	5634.337	5906.731	5471.897	4790.79	5408.395	5793.342	13.676	5182.392	4434.509	13.318
;5278.403	5355.913	5715.189	5786.592	5298.051	5105.154	5408.769	6094.703	4427.271	5606.125	4516.36	12.308
;5330.932	5418.071	5570.04	5521.812	5037.137	5374.567	5257.293	5969.018	4505.669	5663.918	5001.474	14.621
];
t18 = [4982.966	4906.741	5111.035	5167.752	4604.795	4422.563	4735.582	4758.595	14.218	4605.38	4421.04	4361.75
;4891.633	5024.543	5330.476	5450.426	5110.352	4499.444	4214.6	5756.701	12.864	4360.07	5413.313	4443.177
;4661.923	5233.148	5326.839	5394.968	4834.581	4287.982	4607.787	5257.002	13.152	4593.574	5261.067	4361.61
;4803.879	5146.429	5265.361	5824.663	5033.797	4392.474	4855.054	5158.938	13.553	5028.876	5307.591	4811.986
;4781.182	4984.688	5415.13	5738.976	4980.772	4092.002	5037.374	5746.195	15.234	4476.854	4610.709	11.877
;5350.015	5179.594	5603.992	5888.969	5351.278	4688.428	5287.674	5683.514	12.893	4843.554	4203.301	13.897
;5302.166	5287.233	5619.756	5750.952	5200.743	5064.842	5272.701	5999.404	4316.954	5459.385	4236.307	12.277
;5305.452	5327.351	5308.667	5515.095	4996.995	5306.984	5117.809	5837.482	4448.337	5490.046	4911.552	14.091
];



initial = [6082.281	6117.52	6006.781	6218.841	5407.306	5395.139	6343.897	6382.695	34.076	6268.602	5869.429	5928.952
;6250.851	6396.112	6346.854	6306.579	5964.38	5507.287	5727.721	6663.521	35.32	6108.465	6313.456	5895.488
;6038.418	6483.219	6284.896	6319.461	5712.464	5592.232	6107.991	6240.133	37.193	6200.341	6125.302	5956.862
;6025.547	6429.08	6261.861	6450.767	5975.694	5708.006	6264.77	6060.997	35.282	6572.934	6044.822	6352.422
;5928.007	6187.182	6326.297	6406.776	5770.29	5366.863	6345.775	6522.377	38.649	6125.169	5988.254	32.691
;5954.305	6019.484	6497.949	6548.407	6220.078	5829.934	6243.453	6354.438	34.491	6659.32	5609.333	34.523
;6018.066	6430.287	6308.844	6350.424	6123.008	6054.323	6258.185	6636.996	4969.474	6427.159	5789.596	35.243
;6170.207	6190.597	6241.339	6224.858	5958.044	6390.379	6242.963	6416.063	4899.529	6316.324	5800.731	36.255
];

fin = transpose(final);
ini = transpose(initial);


change_norm_final = final./initial;
change_t3 = t3./initial;
change_t6 = t6./initial;
change_t8 = t8./initial;
change_t12 = t12./initial;
change_t16 = t16./initial;
change_t18 = t18./initial;
time = [0 3 6 8 12 16 18 20];


P13 = [change_norm_final(8,1), change_norm_final(7,1), change_norm_final(6,1) ];
P12 =[change_norm_final(8,2), change_norm_final(8,3), change_norm_final(7,3) ];
P11 = [change_norm_final(5,1), change_norm_final(4,1), change_norm_final(3,1) ];
P10 = [change_norm_final(7,2), change_norm_final(6,2), change_norm_final(5,2) ];
P9 = [change_norm_final(2,2), change_norm_final(3,2), change_norm_final(4,2) ];
P8 = [change_norm_final(2,1), change_norm_final(1,1), change_norm_final(1,2) ];
P7 = [change_norm_final(4,3), change_norm_final(5,3), change_norm_final(6,3) ];
P5 = [change_norm_final(3,4), change_norm_final(2,4), change_norm_final(1,4) ];
P6 = [change_norm_final(1,3), change_norm_final(2,3), change_norm_final(3,3) ];
P4 = [change_norm_final(7,5), change_norm_final(6,5), change_norm_final(5,5) ];
P3 = [change_norm_final(7,4), change_norm_final(8,4), change_norm_final(8,5)];
P2 = [change_norm_final(4,4), change_norm_final(5,4), change_norm_final(6,4) ];
P29 = [change_norm_final(8,9), change_norm_final(8,8), change_norm_final(7,8) ];

B255= [change_norm_final(5,1), change_norm_final(4,1), change_norm_final(3,1) ];
B230 = [change_norm_final(7,2), change_norm_final(6,2), change_norm_final(5,2) ];
B204 = [change_norm_final(2,2), change_norm_final(3,2), change_norm_final(4,2) ];
B179 = [change_norm_final(2,1), change_norm_final(1,1), change_norm_final(1,2) ];
B153 = [change_norm_final(4,3), change_norm_final(5,3), change_norm_final(6,3) ];
B128 = [change_norm_final(3,4), change_norm_final(2,4), change_norm_final(1,4) ];
B102 = [change_norm_final(1,3), change_norm_final(2,3), change_norm_final(3,3) ];
B77 = [change_norm_final(7,5), change_norm_final(6,5), change_norm_final(5,5) ];
B51 = [change_norm_final(7,4), change_norm_final(8,4), change_norm_final(8,5),change_norm_final(8,1), change_norm_final(7,1), change_norm_final(6,1) ];
B26= [change_norm_final(4,4), change_norm_final(5,4), change_norm_final(6,4), change_norm_final(8,2), change_norm_final(8,3), change_norm_final(7,3) ];
B0 =  [change_norm_final(8,9), change_norm_final(8,8), change_norm_final(7,8) ];
Wild = [change_norm_final(1,9), change_norm_final(2,9), change_norm_final(3,9), change_norm_final(4,9), change_norm_final(5,9), change_norm_final(6,9) ];


mean_final_bright = [mean(B0) mean(B26) mean(B51) mean(B77) mean(B102) mean(B128) mean(B153) mean(B179) mean(B204) mean(B230) mean(B255)];
std_final_bright  = [std(B0) std(B26) std(B51) std(B77) std(B102) std(B128) std(B153) std(B179) std(B204) std(B230) std(B255)];


brightness = [0 10 20 30 40 50 60 70 80 90 100];

errorbar(brightness, mean_final_bright, std_final_bright,'LineWidth', 3 );
hold on
scatter(brightness, mean_final_bright, 'x','LineWidth', 6);
xlabel('Brightness in % of total output')
ylabel('Normalized GFP Intensity')
title('GFP Expression as a result of photobleaching bacteria at t = 10 min', 'FontSize',12)
axis([-5 105 .75 .94])
figure 


P22_0 = [1 1 1];
P22_3 = [change_t3(2,5), change_t3(3,5), change_t3(4,5)];
P22_6 = [change_t6(2,5), change_t6(3,5), change_t6(4,5)];
P22_8 = [change_t8(2,5), change_t8(3,5), change_t8(4,5)];
P22_12 = [change_t12(2,5), change_t12(3,5), change_t12(4,5)];
P22_16 = [change_t16(2,5), change_t16(3,5), change_t16(4,5)];
P22_18 = [change_t18(2,5), change_t18(3,5), change_t18(4,5)];
P22_20 = [change_norm_final(2,5), change_norm_final(3,5), change_norm_final(4,5)];
Mean22 = [mean(P22_0) mean(P22_3) mean(P22_6) mean(P22_8) mean(P22_12) mean(P22_16) mean(P22_18) mean(P22_20)];
std22 = [std(P22_0) std(P22_3) std(P22_6) std(P22_8) std(P22_12) std(P22_16) std(P22_18) std(P22_20)];
%plot(time, Mean22)

P23_0 = [1 1 1];
P23_3 = [change_t3(1,5), change_t3(1,6), change_t3(2,6)];
P23_6 = [change_t6(1,5), change_t6(1,6), change_t6(2,6)];
P23_8 = [change_t8(1,5), change_t8(1,6), change_t8(2,6)];
P23_12 = [change_t12(1,5), change_t12(1,6), change_t12(2,6)];
P23_16 = [change_t16(1,5), change_t16(1,6), change_t16(2,6)];
P23_18 = [change_t18(1,5), change_t18(1,6), change_t18(2,6)];
P23_20 = [change_norm_final(1,5), change_norm_final(1,6), change_norm_final(2,6)];
Mean23 = [mean(P23_0) mean(P23_3) mean(P23_6) mean(P23_8) mean(P23_12) mean(P23_16) mean(P23_18) mean(P23_20)];
std23 = [std(P23_0) std(P23_3) std(P23_6) std(P23_8) std(P23_12) std(P23_16) std(P23_18) std(P23_20)];
hold on
%plot(time,Mean23,'r')



P24_0 = [1 1 1];
P24_3 = [change_t3(8,7), change_t3(7,7), change_t3(6,7)];
P24_6 = [change_t6(8,7), change_t6(7,7), change_t6(6,7)];
P24_8 = [change_t8(8,7), change_t8(7,7), change_t8(6,7)];
P24_12 = [change_t12(8,7), change_t12(7,7), change_t12(6,7)];
P24_16 = [change_t16(8,7), change_t16(7,7), change_t16(6,7)];
P24_18 = [change_t18(8,7), change_t18(7,7), change_t18(6,7)];
P24_20 = [change_norm_final(8,7), change_norm_final(7,7), change_norm_final(6,7)];
Mean24 = [mean(P24_0) mean(P24_3) mean(P24_6) mean(P24_8) mean(P24_12) mean(P24_16) mean(P24_18) mean(P24_20)];
std24 = [std(P24_0) std(P24_3) std(P24_6) std(P24_8) std(P24_12) std(P24_16) std(P24_18) std(P24_20)];
hold on
%plot(time,Mean24,'g')


P25_0 = [1 1 1];
P25_3 = [change_t3(6,6), change_t3(7,6), change_t3(8,6)];
P25_6 = [change_t6(6,6), change_t6(7,6), change_t6(8,6)];
P25_8 = [change_t8(6,6), change_t8(7,6), change_t8(8,6)];
P25_12 = [change_t12(6,6), change_t12(7,6), change_t12(8,6)];
P25_16 = [change_t16(6,6), change_t16(7,6), change_t16(8,6)];
P25_18 = [change_t18(6,6), change_t18(7,6), change_t18(8,6)];
P25_20 = [change_norm_final(6,6), change_norm_final(7,6), change_norm_final(8,6)];
Mean25 = [mean(P25_0) mean(P25_3) mean(P25_6) mean(P25_8) mean(P25_12) mean(P25_16) mean(P25_18) mean(P25_20)];
std25 = [std(P25_0) std(P25_3) std(P25_6) std(P25_8) std(P25_12) std(P25_16) std(P25_18) std(P25_20)];
hold on
%plot(time,Mean25,'y')

P26_0 = [1 1 1];
P26_3 = [change_t3(5,6), change_t3(4,6), change_t3(3,6)];
P26_6 = [change_t6(5,6), change_t6(4,6), change_t6(3,6)];
P26_8 = [change_t8(5,6), change_t8(4,6), change_t8(3,6)];
P26_12 = [change_t12(5,6), change_t12(4,6), change_t12(3,6)];
P26_16 = [change_t16(5,6), change_t16(4,6), change_t16(3,6)];
P26_18 = [change_t18(5,6), change_t18(4,6), change_t18(3,6)];
P26_20 = [change_norm_final(5,6), change_norm_final(4,6), change_norm_final(3,6)];
Mean26 = [mean(P26_0) mean(P26_3) mean(P26_6) mean(P26_8) mean(P26_12) mean(P26_16) mean(P26_18) mean(P26_20)];
std26 = [std(P26_0) std(P26_3) std(P26_6) std(P26_8) std(P26_12) std(P26_16) std(P26_18) std(P26_20)];
hold on
%plot(time,Mean26,'x')


P27_0 = [1 1 1];
P27_3 = [change_t3(5,7), change_t3(4,7), change_t3(3,7)];
P27_6 = [change_t6(5,7), change_t6(4,7), change_t6(3,7)];
P27_8 = [change_t8(5,7), change_t8(4,7), change_t8(3,7)];
P27_12 = [change_t12(5,7), change_t12(4,7), change_t12(3,7)];
P27_16 = [change_t16(5,7), change_t16(4,7), change_t16(3,7)];
P27_18 = [change_t18(5,7), change_t18(4,7), change_t18(3,7)];
P27_20 = [change_norm_final(5,7), change_norm_final(4,7), change_norm_final(3,7)];
Mean27 = [mean(P27_0) mean(P27_3) mean(P27_6) mean(P27_8) mean(P27_12) mean(P27_16) mean(P27_18) mean(P27_20)];
std27 = [std(P27_0) std(P27_3) std(P27_6) std(P27_8) std(P27_12) std(P27_16) std(P27_18) std(P27_20)];
hold on
%plot(time,Mean27,'o')


P28_0 = [1 1 1];
P28_3 = [change_t3(1,7), change_t3(2,7), change_t3(1,8)];
P28_6 = [change_t6(1,7), change_t6(2,7), change_t6(1,8)];
P28_8 = [change_t8(1,7), change_t8(2,7), change_t8(1,8)];
P28_12 = [change_t12(1,7), change_t12(2,7), change_t12(1,8)];
P28_16 = [change_t16(1,7), change_t16(2,7), change_t16(1,8)];
P28_18 = [change_t18(1,7), change_t18(2,7), change_t18(1,8)];
P28_20 = [change_norm_final(1,7), change_norm_final(2,7), change_norm_final(1,8)];
Mean28 = [mean(P28_0) mean(P28_3) mean(P28_6) mean(P28_8) mean(P28_12) mean(P28_16) mean(P28_18) mean(P28_20)];
std28 = [std(P28_0) std(P28_3) std(P28_6) std(P28_8) std(P28_12) std(P28_16) std(P28_18) std(P28_20)];

errorbar(time, Mean22, std22,'m','LineWidth', 3 );
hold on
%plot(time,Mean28,'*')
errorbar(time, Mean23, std23,'LineWidth', 3 );
hold on
errorbar(time, Mean24, std24,'y','LineWidth', 3 );
hold on
errorbar(time, Mean25, std25,'g','LineWidth', 3 );
hold on
errorbar(time, Mean26, std26,'c','LineWidth', 3 );
hold on
errorbar(time, Mean27, std27,'r','LineWidth', 3 );
hold on
errorbar(time, Mean28, std28,'k','LineWidth', 3 );
axis([-.1 20 .7 1])
hold on
ylabel('Normalized GFP Intensity')
title('GFP Expression as a function of time', 'FontSize',12)
legend('3 min','6 min', '8 min', '12 min', '16 min', '18 min', '20 min')


figure
errorbar(time, Mean28, std28,'LineWidth', 3 );
hold on
scatter(time, Mean28, 'x','LineWidth', 6);
xlabel('Time (min)')
ylabel('Normalized GFP Intensity')
title('GFP Expression as a function of time', 'FontSize',12)
axis([-.1 20 .7 1])


P39_0 = [1 1 1];
P39_3 = [change_t3(2,11), change_t3(3,11), change_t3(4,11)];
P39_6 = [change_t6(2,11), change_t6(3,11), change_t6(4,11)];
P39_8 = [change_t8(2,11), change_t8(3,11), change_t8(4,11)];
P39_12 = [change_t12(2,11), change_t12(3,11), change_t12(4,11)];
P39_16 = [change_t16(2,11), change_t16(3,11), change_t16(4,11)];
P39_18 = [change_t18(2,11), change_t18(3,11), change_t18(4,11)];
P39_20 = [change_norm_final(2,11), change_norm_final(3,11), change_norm_final(4,11)];
Mean39 = [mean(P39_0) mean(P39_3) mean(P39_6) mean(P39_8) mean(P39_12) mean(P39_16) mean(P39_18) mean(P39_20)];
std39 = [std(P39_0) std(P39_3) std(P39_6) std(P39_8) std(P39_12) std(P39_16) std(P39_18) std(P39_20)];
figure
errorbar(time, Mean39, std39,'LineWidth', 3 );
hold on
scatter(time, Mean39, 'x','LineWidth', 6);
xlabel('Time (min)')
ylabel('Normalized GFP Intensity')
title('GFP Expression as a function of time from Neighboring Contaminaion', 'FontSize',12)
axis([-.1 20 .7 1])


P39_0 = [1 1 1];
P39_3 = [change_t3(2,11), change_t3(3,11), change_t3(4,11)];
P39_6 = [change_t6(2,11), change_t6(3,11), change_t6(4,11)];
P39_8 = [change_t8(2,11), change_t8(3,11), change_t8(4,11)];
P39_12 = [change_t12(2,11), change_t12(3,11), change_t12(4,11)];
P39_16 = [change_t16(2,11), change_t16(3,11), change_t16(4,11)];
P39_18 = [change_t18(2,11), change_t18(3,11), change_t18(4,11)];
P39_20 = [change_norm_final(2,11), change_norm_final(3,11), change_norm_final(4,11)];
Mean39 = [mean(P39_0) mean(P39_3) mean(P39_6) mean(P39_8) mean(P39_12) mean(P39_16) mean(P39_18) mean(P39_20)];
std39 = [std(P39_0) std(P39_3) std(P39_6) std(P39_8) std(P39_12) std(P39_16) std(P39_18) std(P39_20)];
figure

B0_raw =  [final(8,9), final(8,8), final(7,8) ];
Wild_raw = [final(1,9), final(2,9), final(3,9), final(4,9), final(5,9), final(6,9) ];

B255_init_raw =[initial(5,1),initial(4,1),initial(3,1)];
B255_raw= [final(5,1), final(4,1), final(3,1) ];


x = [ 1 2 3];
y = [mean(B255_init_raw) mean(B255_raw) mean(Wild_raw)];

bar(x(1),y(1))
hold on
bar(x(2),y(2),'r')
hold on
bar(x(3),y(3),'g')
axis([0 4 0 7000])
ylabel('Raw GFP Intensity Counts')
title('GFP Intensity in GFP Promoter vs. Wild Type E. Coli', 'FontSize',12)
legend('100% Brightness Initial', '100% Brightness Final', 'Wild Type Expression')

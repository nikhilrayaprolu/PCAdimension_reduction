% Start of PCA code, 
Data = imread('fun.jpg');
Dataread=Data;
Data_gray = rgb2gray(Dataread);
Data_whiteblack=Data_gray;
Data_grayD = im2double(Data_whiteblack);
title='numbertitle';
figure, 
set(gcf,title,'off','name','Grayscale Image'),  
imshow(Data_grayD);
Data_formean=Data_grayD;
Data_mean = mean(Data_formean);
[a b] = size(Data_whiteblack);
remeanNewmatrix=Data_mean;
Data_meanNew = repmat(remeanNewmatrix,a,1);

DataAdjust = Data_formean - Data_meanNew;
covAdjust=DataAdjust;
cov_data = cov(covAdjust);   
[V, D] = eig(cov_data); 
eigenvectors=V;

V_trans = transpose(eigenvectors); 
eigenvalues=D;
DataAdjust_trans = transpose(DataAdjust);  
FinalData = V_trans * DataAdjust_trans;   
% End of PCA code 
PCs=0;
PCs=input('Enter number of PC colomuns needed?  '); 
PCs=PCs-0;
PCs = b - PCs;                                                         
Reduced_V = V;
reverseReduced_V=V;
for i = 1:PCs,                                                         
Reduced_V(:,1) =[];
reverseReduced_V(:,1)=[];
end 
ReducedtransposeV=Reduced_V';
Y=ReducedtransposeV* DataAdjust_trans;
Compressed_Data=Reduced_V*Y;
Compressedtranspose=Compressed_Data';
Compressed_Data = Compressedtranspose + Data_meanNew;                     
figure,                                                                
set(gcf,title,'off','name','Compressed Image'),  
imshow(Compressed_Data) 
% End of image compression
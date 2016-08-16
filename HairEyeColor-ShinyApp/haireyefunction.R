data("HairEyeColor")
df<-data.frame(HairEyeColor)
haireyepercent<-function(h,e,s){
 freq<-df[which(df$Sex==s & df$Hair==h & df$Eye==e),'Freq']
 samesexprcent<-round(((freq/sum(df[which(df$Sex==s),'Freq']))*100),digits=2)
 wholesexprcent<-round(((freq/592)*100),digits = 2)
 result<-c(samesexprcent,wholesexprcent)
 return(result)
}
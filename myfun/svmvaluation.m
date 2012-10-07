%•½‹Ï•½•ûŒë·
error = (predictlabel-testlabel').*(predictlabel-testlabel');
error = sum(error)/length(testlabel);

A=((length(testlabel)*sum(predictlabel.*testlabel')-sum(predictlabel)*sum(testlabel))*(length(testlabel)*sum(predictlabel.*testlabel')-sum(predictlabel)*sum(testlabel)));
B=((length(testlabel)*sum(predictlabel.*predictlabel)-sum(predictlabel)*sum(predictlabel))*(length(testlabel)*sum(testlabel.*testlabel)-sum(testlabel)*sum(testlabel)));
CC=A/B;
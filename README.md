# Rubyで読み込んだCSVの行番号の列を追加し、指定列以外削除したい
https://goo.gl/ZCbmsB

リファレンスのdeleteの部分を理解する事ができず、どなたかご教授頂ければと存じます。  
※前提として、ruby（バージョン２）のみの対応を考えています。

---------------------------------------

*◆投稿者のやりたいこと*  
読み込んだcsvへ  
1.列を追加  
2.行番号を取得し、１で取得した列へ値を追加  
3.コード 番地列を削除  
csvを読み込み、加工し、別ファイルで加工したcsvを保存

*◆求めている CSV*  
行番号,都道府県,住所  
1,北海道,札幌市中央区  
2,北海道,札幌市中央区

*◆sample.csv*  
コード,都道府県,住所,番地  
1101,北海道,札幌市中央区,旭ケ丘  
1101,北海道,札幌市中央区,大通東

*◆投稿者のコード*  
> require 'csv'  
> 
> 読み込みファイル名
> data_list = CSV.read('sample.csv')
> 
> ここに処理を記載？
> 
> 生成ファイル名
> file_path = 'index_db.csv'
> 
> CSV.open(file_path, 'wb') do |csv|
>   data_list.each do |rec|
>     csv << rec
>   end
> end

---------------------------------------

*◆勉強会にて*  
1.色々な問題がごっちゃになっている。  
2.投稿者は「リファレンスの delete の部分を〜」と言っているが、CSV::Table クラスのことを指している。  
　しかし CSV は Array クラスになるので、CSV::Table クラスを使うのは違うのではないか。  
　なので CSV を 配列として考えて実装する。

---------------------------------------

*◆独自の解釈*  
CSV だと、エクセルがイメージされ、なおかつ html の table がイメージされる。  
勉強会では、「配列」として考えるとなっていたが、CSV::Table クラスを使用しての実装が私は良いと思った。

*◆投稿者の要望を踏まえてやりたいこと*  
1.コード列・番地列の削除  
2.先頭列に行番号列の追加  
3.行番号列に1からの採番
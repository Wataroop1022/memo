require "csv"

p "1(新規でメモを作成) 2(既存のメモ編集する)"
memo_type = gets.to_i

if memo_type == 1
  p ("拡張子を除いたファイル名を入力してください")
  title = gets.chomp
  p "メモしたい内容を記入してください\n完了したらCtrl + Dを押します"
  content = gets.chomp
  CSV.open("#{title}.csv", "w") do |csv| 
    csv << ["#{content}"]
  end 
elsif memo_type == 2
  p ("書き換えるファイル名を入力してください")
  filename = gets.chomp
  p "変更する内容を記入してください\n完了したらCtrl + Dを押します"
  revised_content = gets.chomp
  CSV.open("#{filename}.csv","a") do |csva|
    csva << ["#{revised_content}"]
  end
else
  p "1か2を入力してください"
end
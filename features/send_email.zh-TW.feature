# language: zh-TW

功能: 用戶可以發出電子郵件給朋友
  為了聯絡好友
  作為一名訪客
  我要發出電子郵件給朋友

  背景:
    假設 選用 中文

  場景: 用戶輸入了完整的資料，便可發出電子郵件給朋友
    假設 我來到首頁
    當 我在"發件人姓名"欄位中輸入"陳大文"
    而且 在"發件人電郵地址"欄位中輸入"taiming@example.com"
    而且 在"收件人姓名"欄位中輸入"李小強"
    而且 在"收件人電郵地址"欄位中輸入"peter@example.com"
    而且 在"標題"欄位中輸入"你好嗎"
    而且 在"內容"欄位中輸入"好久不見，你近況如何?"
    而且 按下了"發出電子郵件"按钮
    那麼 我停留在首頁
    而且 我應該看到"電子郵件經已發出"的提示信息
    那麼 "peter@example.com"應該收到 1 封電子郵件標題是"你好嗎"
    當 "peter@example.com"閱讀標題為"你好嗎"的電子郵件
    那麼 在電子郵件裡中應該寫着"好久不見，你近況如何?"


  場景大綱: 用戶輸入了資料，如果資料是完整，系統會發出電子郵件
    假設 我來到首頁
    當 我在"發件人姓名"欄位中輸入"<發件人>"
    而且 在"發件人電郵地址"欄位中輸入"<發件人電郵地址>"
    而且 在"收件人姓名"欄位中輸入"<收件人>"
    而且 在"收件人電郵地址"欄位中輸入"<收件人電郵地址>"
    而且 在"標題"欄位中輸入"<標題>"
    而且 在"內容"欄位中輸入"<內容>"
    而且 按下了"發出電子郵件"按钮
    那麼 我停留在首頁
    而且 我應該看到"電子郵件經已發出"的提示信息
    那麼 "<收件人電郵地址>"應該收到 1 封電子郵件標題是"<標題>"
    當 "<收件人電郵地址>"閱讀標題為"<標題>"的電子郵件
    那麼 在電子郵件裡中應該寫着"<內容>"

    例子:
      | 發件人 | 發件人電郵地址 | 收件人 | 收件人電郵地址 | 標題 | 內容 |
      | 黃先生 | man@example.com | 何小姐 | woman@example.com | 你好嗎 | 好久不見! |
      | 張經理 | manager@example.com | 李律師 | lawyer@example.com | 請幫忙 | 晚上請來一聚 |


  場景: 用戶輸入不完整的資料，系統並不會發出電子郵件
    假設 我來到首頁
    當 我在"發件人姓名"欄位中輸入"陳大文"
    而且 在"發件人電郵地址"欄位中輸入"taiming@example"
    而且 在"收件人姓名"欄位中輸入"李小強"
    而且 在"收件人電郵地址"欄位中輸入"peter@example.com"
    而且 在"標題"欄位中輸入"你好嗎"
    而且 在"內容"欄位中輸入"好久不見，你近況如何?"
    而且 按下了"發出電子郵件"按钮
    那麼 我停留在首頁
    而且 我應該看到"未能發出電子郵件"的提示信息
    那麼 "peter@example.com"不會收到封電子郵件


  場景大綱: 由於用戶輸入了不完整的資料，系統不會發出電子郵件
    假設 我來到首頁
    當 我在"發件人姓名"欄位中輸入"<發件人>"
    而且 在"發件人電郵地址"欄位中輸入"<發件人電郵地址>"
    而且 在"收件人姓名"欄位中輸入"<收件人>"
    而且 在"收件人電郵地址"欄位中輸入"<收件人電郵地址>"
    而且 在"標題"欄位中輸入"<標題>"
    而且 在"內容"欄位中輸入"<內容>"
    而且 按下了"發出電子郵件"按钮
    那麼 我停留在首頁
    而且 我應該看到"未能發出電子郵件"的提示信息
    那麼 "peter@example.com"不會收到封電子郵件

    例子:
      | 發件人 | 發件人電郵地址 | 收件人 | 收件人電郵地址 | 標題 | 內容 |
      |       | man@example.com | 何小姐 | woman@example.com | 你好嗎 | 好久不見! |
      | 黃先生 | man@example     | 何小姐 | woman@example.com | 你好嗎 | 好久不見! |
      | 黃先生 | man@example.com |       | woman@example.com | 你好嗎 | 好久不見! |
      | 黃先生 | man@example.com | 何小姐 | woman@example     | 你好嗎 | 好久不見! |
      | 黃先生 | man@example.com | 何小姐 | woman@example.com |       | 好久不見! |
      | 黃先生 | man@example.com | 何小姐 | woman@example.com | 你好嗎 |          |


PrawnRails.config do |config|
    config.page_layout = :portrait
    config.page_size   = "A4"
    config.skip_page_creation = false
  end
  $THAI_FONTS = {
    "THSarabunNew" => {
      :normal => Rails.root.join("app/assets/fonts/thai/THSarabunNew.ttf"),
      :italic => Rails.root.join("app/assets/fonts/thai/THSarabunNew Italic.ttf"),
      :bold => Rails.root.join("app/assets/fonts/thai/THSarabunNew Bold.ttf"),
      :bold_italic => Rails.root.join("app/assets/fonts/thai/THSarabunNew BoldItalic.ttf")
    },
    "THSarabun" => {
      :normal => Rails.root.join("app/assets/fonts/thai/THSarabun.ttf"),
      :italic => Rails.root.join("app/assets/fonts/thai/THSarabun Italic.ttf"),
      :bold => Rails.root.join("app/assets/fonts/thai/THSarabun Bold.ttf"),
      :bold_italic => Rails.root.join("app/assets/fonts/thai/THSarabun BoldItalic.ttf")
    }
  }
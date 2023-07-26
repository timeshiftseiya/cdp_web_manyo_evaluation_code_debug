class MyFormatter
  RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_group_started, :start, :stop
  def initialize(output)
    @output = output
  end

  def start(notification)
    @output << "---\ntitle: 課題評価のフィードバック\n---\n"
  end

  def example_passed(notification)
    @output << "- ✅ #{notification.example.description}\n"
  end

  def example_group_started(notification)
    if notification.group.to_s.count(':') == 4
      @output << "# #{notification.group.description}\n"
    elsif notification.group.to_s.count(':') == 8
      @output << "### #{notification.group.description}\n"
    elsif notification.group.to_s.count(':') == 10
      @output << "###### #{notification.group.description}\n"
    end
  end

  def example_failed(notification)
    @output << "- [ ] ❌ #{notification.example.description}\n"
  end
  
  def stop(notification)
    if notification.examples.count == 0
      @output << "## 評価が実行できませんでした。コード内に構文エラーがないか確認してください。\n### よくある構文エラー\n- コードのタイプミス\n- `end`が抜けている"
    end
  end
end

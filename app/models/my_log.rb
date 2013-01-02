class MyLog
    def self.log(message)
        @@my_log ||= Logger.new("#{Rails.root}/log/my.log")
        @@my_log.info("#{Time.now.inspect}: #{message}")
    end
end

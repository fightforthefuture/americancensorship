require "csv"

# BSD CSV Template
# Personal Email,Work Email,Prefix,First Name,Middle Name,Last Name,Suffix,Address 1,Address 2,City,State,Zip Code,Country,Phone,Work Phone,Mobile Phone,Gender,Employer,Occupation
# joe@example.com,joe@work.example.com,Mr,Joe,Q.,Smith,Jr,123 Fake St,Apt #2,Springfield,KY,12345,US,472-555-1212,472-555-2345,472-555-9876,M,Example Co.,processor

namespace :export do
  task :congress_emails => :environment do
    puts "Starting export."

    CSV_FILE_PATH = File.join(File.dirname(__FILE__), "congress_emails.csv")
    
    CSV.open(CSV_FILE_PATH, "w") do |csv|
      csv << [
              "Personal Email",
              "First Name",
              "Address 1",
              "Zip Code",
              "custom-94"
             ]
      CongressEmail.all.each do |ce|        
        csv << [
                ce.email,
                ce.name,
                ce.address,
                ce.zip,
                ce.letter
               ]
        print "."
      end
      print "\n"
      puts "Finished writing records."
    end
    puts "Output file is at: #{CSV_FILE_PATH}"
  end
end

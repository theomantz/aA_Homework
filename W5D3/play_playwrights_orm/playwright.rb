require_relative 'plays.rb'

class PlaywrightDBConnection < SQLite3::Database

    include Singleton

    def initialize
        super('plays.db')
        self.type_translation = true
        self.results_as_hash = true
    end

end



class Playwright

    attr_accessor :id, :name, :birth_year

    def self.all
        data = PlaywrightDBConnection.instance.execute("SELECT * FROM playwrights")
        data.map { |datum| Playwright.new(datum) }
    end

    def self.find_by_name
    PlaywrightDBConnection.instance.execute(<<-SQL, self.name)
      SELECT
        *
      FROM
        playwrights
      WHERE
        name = ?
    SQL
    end
    
    def initialize(options)
        @id = options['id']
        @name = options['name']
        @birth_year = options['birth_year']
    end

    def create
        raise "#{self} already in database" if self.id
        PlaywrightDBConnection.instance.execute(<<-SQL, self.name, self.birth_year)
            INSERT INTO
                playwrights (name, bith_year)
        SQL
    end
    
end
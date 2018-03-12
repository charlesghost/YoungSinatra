class Mixtape 

	attr_accessor :id, :title, :body

	def self.open_connection
		conn = PG.connect( dbname: "mixtape")

	end

	def self.all
    	conn = self.open_connection

    	sql = "SELECT id, title, body FROM mixtape ORDER BY ID"

    	result = conn.exec(sql)

    	mixtape = result.map do |tuple|

    		self.hydrate tuple
    	end

    	mixtape

    end

    def self.hydrate mixtape_data

    	mixtape = Mixtape.new 

    	mixtape.id = mixtape_data['id']
    	mixtape.title = mixtape_data['title']
    	mixtape.body = mixtape_data['body']

    	mixtape
    
    end

    def self.find id 

    	conn = self.open_connection

    	sql = "SELECT * FROM mixtape WHERE id = #{id} LIMIT 1"
    	mixtapes = conn.exec(sql)
        mixtape = self.hydrate mixtapes[0]

        mixtape

    end

    def save 

    	conn = Mixtape.open_connection

     	if(!self.id)
       	
       	sql = "INSERT INTO mixtape (title , body) VALUES ( '#{self.title}', '#{self.body}')"
        else
       	
       	sql = "UPDATE mixtape SET title='#{self.title}', body='#{self.body}' WHERE id = #{self.id}"

    end

    conn.exec(sql)

    def destroy id 

    	conn = Post.open_connection

    	sql = "DELETE FROM mixtape where id = #{id}"

    	conn.exec(sql)

    end

end 
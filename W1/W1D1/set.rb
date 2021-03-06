class HashSet
    def initialize
        @store = {}
    end
    
    def insert(el)
        store[el] = true
    end
    
    def include?(el)
        store.has_key?(el)
    end
    
    def delete(el)
        return false unless self.include?(el)
        store.delete(el)
        true
    end
    
    def to_a
        store.keys
    end
    
    def union(set2)
        new_set = HashSet.new
        self.to_a.each { |el| new_set.insert(el) }
        set2.to_a.each { |el| new_set.insert(el) }
        new_set
    end
    
    def intersect(set2)
        new_set = HashSet.new
        self.to_a.each do |el|
            next unless set2.include?(el)
            new_set.insert(el)
        end
        new_set
    end
    
    def minus(set2)
        new_set = HashSet.new
        self.to_a.each do |el|
            next if set2.include?(el)
            new_set.insert(el)
        end
        new_set
    end
    
    protected
    attr_reader :store
end

def correct_hash(wrong_hash)
    corrected_hash = {}
    
    wrong_hash.each do |wrong_key, value|
        wrong_key_place = wrong_key.to_s.ord - "a".ord
        corrected_key =
        ("a".ord + ((wrong_key_place + 1) % 26)).chr.to_sym
        
        corrected_hash[corrected_key] = value
    end
    
    corrected_hash
end
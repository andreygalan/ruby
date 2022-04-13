class Post_list
    attr_reader :post_list
    def initialize(arr=Array.new())
        @post_list=arr
        @selected_note=0
    end

    def add_note(post)
        @post_list.append(post)
    end

    def choose_note(index)
        @selected_note=index
    end

    def change_note(post)
        @post_list[@selected_note]=post
    end
    
    def get_note()
        @post_list[@selected_note]
    end

    def delete_note()
        @post_list.delete_at(@selected_note)
        @selected_note=0
    end

    def Post_list.read_from_txt(path)
        file = File.new(path, "r:UTF-8")
        text = file.read
        arr = text.split((/\n_+\n/)).map do|post|
            Post.get_post_str(post)
        end
        Post_list.new(arr)
    end
    
    def write_to_txt(path)
        File.open("#{path}", "w") do |file|
            @post_list.each do |e|
                file.puts e
                file.puts "_"
            end
        end
    end

    def write_to_yaml(path)
        File.open(path, "w") do |file|
            file.write(YAML.dump(@post_list))
        end
    end
    
    def Post_list.read_from_yaml(path) 
        Post_list.new(Psych.safe_load_file(path, permitted_classes: [Post]))
    end

    def get_vacancies()
        @post_list.select{|post| post.vacancy}
    end

    def sort_by_name()
        @post_list.sort_by!{|post| post.post_name.downcase}
    end

    def to_s()
        str=""
        @post_list.each do |post|
            str+=post.to_s() +"\n"+"_\n"
        end
        str
    end
end
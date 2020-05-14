resource "aws_dynamodb_table" "pelodata_custom_programs" {
    name           = "PelodataCustomPrograms"
    hash_key       = "Id"
    write_capacity = 5
    read_capacity  = 5
    
    attribute {
        name = "Id"
        type = "S"
    }
    
    tags = {
        Name = "Pelodata-DB"
        App  = "Pelodata"   
    }
}

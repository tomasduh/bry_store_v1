import { IsDate, IsEmail, IsNotEmpty, IsNumber, IsString, Min } from "class-validator"


export class CreateUserDto{

    @IsString()
    @IsNotEmpty()
    Nombre: string

    @IsString()
    @IsNotEmpty()
    Apellido: string
    
    @IsString()
    @IsNotEmpty()
    Cedula: string
    
    @IsString()
    @IsNotEmpty()
    Cel: string
    
    @IsEmail()
    @IsNotEmpty()
    Email: string

    @Min(8)
    @IsNotEmpty()
    Contra: string

    @IsString()
    @IsNotEmpty()
    Direccion: string

    @IsDate()
    @IsNotEmpty()
    Fecha_nac: Date | string
    
    @IsNumber()
    @IsNotEmpty()
    id_ciudad: number

}
import { PartialType } from '@nestjs/mapped-types';


export class UpdateUserDto extends PartialType(CreateUserDto) {

}

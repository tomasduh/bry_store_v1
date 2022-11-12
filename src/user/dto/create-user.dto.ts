import { IsDate, IsEmail, IsNumber, IsString, Min } from "class-validator"


export class CreateUserDto{

    @IsString()
    Nombre: string
    @IsString()
    Apellido: string
    @IsString()
    Cedula: string
    @IsString()
    Cel: string
    @IsEmail()
    Email: string
    @Min(8)
    Contra: string
    @IsString()
    Direccion: string
    @IsDate()
    Fecha_nac?: Date | string
    @IsNumber()
    ciudad: number

}

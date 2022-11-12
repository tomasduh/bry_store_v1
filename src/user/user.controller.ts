import {
  Controller,
  Get,
  Param,
  Post,
  Body,
  Put,
  Delete,
} from '@nestjs/common';
import { UserService } from './user.service';
import { usuario as UserModel } from '@prisma/client';
import { CreateUserDto } from './dto/create-user.dto';

@Controller()
export class UserController {
constructor(
  private readonly UserService: UserService,){} 


@Get('users')
async getUsers(): Promise<UserModel[]> {
  return this.UserService.users({});
}

@Get('user/:id')
async getUserById(
  @Param('id') id: string): Promise<UserModel> {
  return this.UserService.user({ idUsuario: Number(id) });
}

@Post('user/create')
async createUser (
  @Body() productData:CreateUserDto
):Promise<UserModel>{
  return this.UserService.createUser(productData);
}

@Put('user/update/:id')
async updateUser(
  @Body() productData:{Nombre:string, Precio:number, Cantidad:number, marca:number, subcategoria:number},
  @Param('id') id:string):Promise<UserModel>{
  return this.UserService.updateUser({
    data: productData,
    where: { idUsuario: Number(id) },
  })
}
}
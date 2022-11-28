import { Injectable } from '@nestjs/common';
import { PrismaService } from '../database/database.services';
import { usuario, Prisma } from '@prisma/client';
import { CreateUserDto } from './dto/create-user.dto';

@Injectable()
export class UserService {
  constructor(private prisma: PrismaService) {}

  async user(
    usuarioWhereUniqueInput: Prisma.usuarioWhereUniqueInput,
  ): Promise<usuario | null> {
    return this.prisma.usuario.findUnique({
      where: usuarioWhereUniqueInput,
    });
  }
  async users(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.usuarioWhereUniqueInput;
    where?: Prisma.usuarioWhereInput;
    orderBy?: Prisma.usuarioOrderByWithRelationInput;
  }): Promise<usuario[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return this.prisma.usuario.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async createUser(data: CreateUserDto): Promise<CreateUserDto> {
    return  await this.prisma.usuario.create({
      data,
    });
  }

  async updateUser(params: {
    where: Prisma.usuarioWhereUniqueInput;
    data: Prisma.usuarioUpdateInput;
  }): Promise<usuario> {
    const { where, data } = params;
    return this.prisma.usuario.update({
      data,
      where,
    });
  }

  async deleteUser(where: Prisma.usuarioWhereUniqueInput): Promise<usuario> {
    return this.prisma.usuario.delete({
      where,
    });
  }
}
import { Injectable } from '@nestjs/common';
import { PrismaService } from '../database/database.services';
import { producto, Prisma } from '@prisma/client';

@Injectable()
export class ProductService {
  constructor(private prisma: PrismaService) {}

  async produc(
    productWhereUniqueInput: Prisma.productoWhereUniqueInput,
  ): Promise<producto | null> {
    return this.prisma.producto.findUnique({
      where: productWhereUniqueInput,
    });
  }
  async producs(params: {
    skip?: number;
    take?: number;
    cursor?: Prisma.productoWhereUniqueInput;
    where?: Prisma.productoWhereInput;
    orderBy?: Prisma.productoOrderByWithRelationInput;
  }): Promise<producto[]> {
    const { skip, take, cursor, where, orderBy } = params;
    return this.prisma.producto.findMany({
      skip,
      take,
      cursor,
      where,
      orderBy,
    });
  }

  async createProduc(data: Prisma.productoCreateInput): Promise<producto> {
    return this.prisma.producto.create({
      data,
    });
  }

  async updateProduct(params: {
    where: Prisma.productoWhereUniqueInput;
    data: Prisma.productoUpdateInput;
  }): Promise<producto> {
    const { where, data } = params;
    return this.prisma.producto.update({
      data,
      where,
    });
  }

  async deleteProduct(where: Prisma.productoWhereUniqueInput): Promise<producto> {
    return this.prisma.producto.delete({
      where,
    });
  }
}
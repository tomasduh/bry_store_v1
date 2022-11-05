import {
    Controller,
    Get,
    Param,
    Post,
    Body,
    Put,
    Delete,
  } from '@nestjs/common';
  import { ProductService } from './productos.services';
  import { producto as ProductModel } from '@prisma/client';

  @Controller()
export class ProductController {
  constructor(
    private readonly ProductService: ProductService,){} 

  
  @Get('products')
  async getProducts(): Promise<ProductModel[]> {
    return this.ProductService.producs({});
  }

  @Get('product/:id')
  async getProductById(@Param('id') id: string): Promise<ProductModel> {
    return this.ProductService.produc({ idProducto: Number(id) });
  }

  // @Post('produict/create')
  // async createProduct (
  //   @Body() productData:{nombre:string, precio:number, cantidad:number, id_marca:number, id_subcategoria:number}
  // ):Promise<ProductModel>{
  //   return this.ProductService.createProduc(productData);
  // }
}
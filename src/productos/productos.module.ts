import { Module } from '@nestjs/common';
import { DatabaseModule } from 'src/database/database.module';
import { ProductService } from './productos.services';
import { ProductController } from './product.controller';

@Module({
    controllers:[ProductController],
    providers:[ProductService],
    imports:[DatabaseModule],
    exports:[ProductService]
})
export class ProductosModule {}

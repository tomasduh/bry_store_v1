import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { Config } from './config/config.keys';
import { ConfigModule } from './config/config.module';
import { ConfigService } from './config/config.service';
import { DatabaseModule } from './database/database.module';
import { ProductosModule } from './productos/productos.module';

@Module({
  imports: [ConfigModule, DatabaseModule, ProductosModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {
  static port: number|string;

  constructor (private readonly _ConfigService: ConfigService){
    AppModule.port = this._ConfigService.get(Config.PORT)
  }
}

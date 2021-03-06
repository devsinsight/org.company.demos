﻿import {inject} from 'aurelia-framework';
import {Service} from 'order/service';
import {Carousel} from 'common/components/carousel'

@inject(Service, Carousel)
export class ProductDetail
{
    constructor(service, carousel){
        this.product = {};
        this.service = service;
        this.carousel = carousel;
    }

    attached(){
        if(this.product.productId === this.first.productId)
            this.carousel.start();
    }

    add(){
        this.service.addToCart(this.product, "cart");

        parent.$.fancybox.close();
    }

    bind(context)
    {
        this.first = context.carousel.first;
    }

    activate(product){
        

        this.product = product
    }
}
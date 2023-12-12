package com.grupo4.digitalcars.services.impl;

import com.grupo4.digitalcars.model.Product;
import com.grupo4.digitalcars.exception.BadRequestException;
import com.grupo4.digitalcars.model.Image;
import com.grupo4.digitalcars.repository.ImageRepository;
import com.grupo4.digitalcars.repository.ProductRepository;
import com.grupo4.digitalcars.services.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ImageServiceImpl implements ImageService {
    @Autowired
    ImageRepository imageRepository;

    @Autowired
    ProductRepository productRepository;

    @Override
    public List<Image> getAllImages() {
        return imageRepository.findAll();
    }

    @Override
    public Optional<Image> getImageById(Integer id) {
        return imageRepository.findById(id);
    }

    @Override
    public Image saveImage(Image image, Integer productId) {
        Optional<Product> optProduct = productRepository.findById(productId);

            image.setProduct(optProduct.get());
            return imageRepository.save(image);
        }

    @Override
    public Image updateImage(Image image,Integer productId) throws BadRequestException {
        Optional<Image> imageBdd = imageRepository.findById(image.getId());
        boolean productDidntChange = imageBdd.get().getProduct().getId().equals(productId);

        if (!productDidntChange) {
            throw new BadRequestException("La imagen no corresponde al producto con ID: "+ productId);
        }

        imageBdd.get().setTitle(image.getTitle());
        imageBdd.get().setUrl(image.getUrl());
        return imageRepository.save(imageBdd.get());
    }

    @Override
    public void deleteImageById(Integer id) {
        imageRepository.deleteById(id);
    }
}

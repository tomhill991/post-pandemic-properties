import React, {useState, useEffect} from "react"
import {Image, Video, Transformation, CloudinaryContext} from 'cloudinary-react';
import SwiperCore, { Pagination } from 'swiper';
import { Swiper, SwiperSlide } from 'swiper/react';
import 'swiper/components/pagination/pagination.scss';
import 'swiper/swiper.scss';
SwiperCore.use([Pagination]);

const PropertyCard = props => {
  const [property, setProperty] = useState(props.property)
  const [swiper, setSwiper] = useState(null)

  useEffect(() => {
    setProperty(props.property)
    console.log(property)
  }, [props.property])

  return (
    <div className="property-card">
      <span className="close" onClick={() => props.closeCard(null)}></span>
      <Swiper
        spaceBetween={0}
        slidesPerView={1}
        pagination={{ clickable: true }}
        onSwiper={(swiper) => setSwiper(swiper)}
        onSlideChange={() => console.log('slide change')}
      >
        {
          property.images.map(image => (
            <SwiperSlide>
              <img src={image} alt=""/>
            </SwiperSlide>
          ))
        }
      </Swiper>
      <div className="content">
        <div className="top half">
          <p className="normal">{property.title}</p>
          <p className="large">{property.address}</p>
        </div>
        <div className="bottom half">
          <p className="normal">{property.max_guests} guests</p>
        </div>

        <a href={"/properties/" + property.id} className="button red">
          <span>View property</span>
        </a>
      </div>
    </div>
  );
}

export default PropertyCard

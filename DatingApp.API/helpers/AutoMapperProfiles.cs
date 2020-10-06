using System.Linq;
using AutoMapper;
using DatingApp.API.Dtos;
using DatingApp.API.Models;

namespace DatingApp.API.helpers
{
    public class AutoMapperProfiles: Profile
    {
        public AutoMapperProfiles()
        {
            CreateMap<User, UserForListDto>()
               .ForMember(dest => dest.PhotoUrl, 
                          options => options.MapFrom( src => src.Photos.FirstOrDefault( p => p.isMain).Url))
               .ForMember(dest => dest.Age, 
                          options => options.MapFrom(src => src.DateOfBirth.CalculateAge()));
            CreateMap<User, UserForDetailDto>()
               .ForMember(dest => dest.PhotoUrl, 
                          options => options.MapFrom( src => src.Photos.FirstOrDefault( p => p.isMain).Url))
               .ForMember(dest => dest.Age, 
                          options => options.MapFrom(src => src.DateOfBirth.CalculateAge()));

            CreateMap<Photo, PhotosForDetailDto>();
            CreateMap<UserForUpdateDto, User>();
            CreateMap<Photo, PhotoForReturnDto>();
            CreateMap<PhotoForCreationDto, Photo>();
            CreateMap<UserForRegisterDto, User>();
            CreateMap<MessageForCreationDto, Message>().ReverseMap();
            CreateMap<Message, MessageToReturnDto>()
                    .ForMember( m => m.SenderPhotoUrl, opt => opt
                        .MapFrom(u => u.Sender.Photos.FirstOrDefault(p => p.isMain).Url))
                    .ForMember( m => m.RecipientPhotoUrl, opt => opt
                        .MapFrom(u => u.Recipient.Photos.FirstOrDefault(p => p.isMain).Url));
            
        }
    }
}
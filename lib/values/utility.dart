import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_maps_demo/values/appStrings.dart';

class Utility {
  getBoxDecoration({double radius, Color color}) {
    return BoxDecoration(
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 4,
            color: Colors.black26,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)));
  }

  static String getMapUrl(String latitude, String longitude) {
    String width = "512";
    String height = "512";
    return AppStrings.MAP_BASE_URL +
        "?zoom=13&size=" +
        width +
        "x" +
        height +
        "&maptype=roadmap&markers=" +
        latitude +
        "," +
        longitude +
        "&key=" +
        AppStrings.MAPS_API_KEY;
  }

  static Widget imageLoader(String url, String placeholder,
      {BoxFit fit = BoxFit.cover,
      double height,
      double width,
      double progresswidth}) {
    return (url == "null" || url == null || url.trim() == "")
        ? height != null && width != null
            ? Image.asset(
                placeholder,
                width: width,
                height: height,
              )
            : Image.asset(placeholder)
        : CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit,
                ),
              ),
            ),
            placeholder: (context, url) =>
                progress(context, width: progresswidth),
            errorWidget: (context, url, error) =>
                height != null && width != null
                    ? Image.asset(
                        placeholder,
                        width: width,
                        height: height,
                      )
                    : Image.asset(placeholder),
          );
  }

  static Widget progress(BuildContext context, {double width}) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Container(
        color: Colors.transparent,
        width: width ?? MediaQuery.of(context).size.width / 4,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
      ),
    );
  }
}

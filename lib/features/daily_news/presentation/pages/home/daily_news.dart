import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily News'),
      ),
      body: BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
        builder: (_, state) {
          if (state is RemoteArticlesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is RemoteArticlesErrorState) {
            return Center(child: Text(state.error!.message!));
          }
          if (state is RemoteArticlesDoneState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: Text(state.articles![index].title!),
                );
              },
              itemCount: state.articles!.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

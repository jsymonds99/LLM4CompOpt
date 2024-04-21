; ModuleID = 'hw2perf.c'
source_filename = "hw2perf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"%lld\0A\00", align 1

; Function Attrs: minsize nounwind optsize uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [1000 x i64], align 16
  %2 = alloca [1000 x i64], align 16
  %3 = alloca [1000 x i64], align 16
  %4 = alloca [1000 x i64], align 16
  call void @llvm.lifetime.start.p0(i64 8000, ptr nonnull %1) #4
  call void @llvm.lifetime.start.p0(i64 8000, ptr nonnull %2) #4
  call void @llvm.lifetime.start.p0(i64 8000, ptr nonnull %3) #4
  call void @llvm.lifetime.start.p0(i64 8000, ptr nonnull %4) #4
  br label %5

5:                                                ; preds = %8, %0
  %6 = phi i64 [ %15, %8 ], [ 0, %0 ]
  %7 = icmp eq i64 %6, 1000
  br i1 %7, label %16, label %8

8:                                                ; preds = %5
  %9 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %6
  store i64 %6, ptr %9, align 8, !tbaa !5
  %10 = shl nuw nsw i64 %6, 1
  %11 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %6
  store i64 %10, ptr %11, align 8, !tbaa !5
  %12 = mul nuw nsw i64 %6, 3
  %13 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %6
  store i64 %12, ptr %13, align 8, !tbaa !5
  %14 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %6
  store i64 0, ptr %14, align 8, !tbaa !5
  %15 = add nuw nsw i64 %6, 1
  br label %5, !llvm.loop !9

16:                                               ; preds = %5
  tail call void @srand(i32 noundef 4) #5
  br label %17

17:                                               ; preds = %96, %16
  %18 = phi i64 [ %100, %96 ], [ 0, %16 ]
  %19 = phi i32 [ %97, %96 ], [ 0, %16 ]
  %20 = phi i32 [ %98, %96 ], [ 15, %16 ]
  %21 = phi i32 [ %99, %96 ], [ 5, %16 ]
  %22 = icmp eq i64 %18, 1000000000
  br i1 %22, label %101, label %23

23:                                               ; preds = %17
  %24 = sext i32 %21 to i64
  %25 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %24
  %26 = load i64, ptr %25, align 8, !tbaa !5
  %27 = mul i64 %26, 87
  %28 = sdiv i64 %27, 4
  %29 = add nsw i64 %28, 23
  %30 = zext i32 %20 to i64
  %31 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %30
  %32 = load i64, ptr %31, align 8, !tbaa !5
  %33 = mul i64 %32, 231
  %34 = sdiv i64 %33, 3
  %35 = add nsw i64 %34, 59
  %36 = add nsw i64 %35, %29
  %37 = srem i64 %36, 1000
  %38 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %37
  %39 = load i64, ptr %38, align 8, !tbaa !5
  %40 = add i64 %32, %26
  %41 = add i64 %40, %39
  %42 = mul nsw i64 %29, 11
  %43 = mul nsw i64 %35, 13
  %44 = mul nsw i64 %41, 17
  %45 = add i64 %42, %18
  %46 = add i64 %45, %43
  %47 = add i64 %46, %44
  %48 = trunc i64 %18 to i32
  %49 = urem i32 %48, 1000
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %50
  store i64 %47, ptr %51, align 8, !tbaa !5
  %52 = icmp ult i64 %18, 100
  br i1 %52, label %53, label %96

53:                                               ; preds = %23, %57
  %54 = phi i64 [ %90, %57 ], [ 0, %23 ]
  %55 = phi i32 [ %89, %57 ], [ %19, %23 ]
  %56 = icmp eq i64 %54, 1000000
  br i1 %56, label %91, label %57

57:                                               ; preds = %53
  %58 = zext i32 %55 to i64
  %59 = getelementptr inbounds [1000 x i64], ptr %2, i64 0, i64 %58
  %60 = load i64, ptr %59, align 8, !tbaa !5
  %61 = mul nsw i64 %60, 6
  %62 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %58
  %63 = load i64, ptr %62, align 8, !tbaa !5
  %64 = sdiv i64 %63, 2
  %65 = add nsw i64 %64, %61
  %66 = srem i64 %65, 1000
  %67 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %66
  %68 = load i64, ptr %67, align 8, !tbaa !5
  %69 = shl nsw i64 %68, 1
  %70 = shl nsw i64 %60, 2
  %71 = add nsw i64 %69, %70
  %72 = srem i64 %71, 1000
  %73 = getelementptr inbounds [1000 x i64], ptr %3, i64 0, i64 %72
  %74 = load i64, ptr %73, align 16, !tbaa !5
  %75 = mul nsw i64 %74, 6
  %76 = getelementptr inbounds [1000 x i64], ptr %1, i64 0, i64 %58
  %77 = load i64, ptr %76, align 8, !tbaa !5
  %78 = mul nsw i64 %77, 3
  %79 = add nsw i64 %78, %75
  %80 = shl nsw i64 %79, 1
  %81 = add i64 %65, %54
  %82 = add i64 %81, %71
  %83 = add i64 %82, %80
  %84 = trunc i64 %54 to i32
  %85 = urem i32 %84, 100
  %86 = zext i32 %85 to i64
  %87 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %86
  store i64 %83, ptr %87, align 8, !tbaa !5
  %88 = icmp ult i64 %54, 10
  %89 = select i1 %88, i32 59, i32 %55
  %90 = add nuw nsw i64 %54, 1
  br label %53, !llvm.loop !11

91:                                               ; preds = %53
  %92 = icmp eq i64 %18, 0
  br i1 %92, label %93, label %96

93:                                               ; preds = %91
  %94 = tail call i32 @rand() #5
  %95 = srem i32 %94, 1000
  br label %96

96:                                               ; preds = %91, %93, %23
  %97 = phi i32 [ %55, %93 ], [ %19, %23 ], [ %55, %91 ]
  %98 = phi i32 [ %20, %93 ], [ %20, %23 ], [ 37, %91 ]
  %99 = phi i32 [ %95, %93 ], [ %21, %23 ], [ %21, %91 ]
  %100 = add nuw nsw i64 %18, 1
  br label %17, !llvm.loop !12

101:                                              ; preds = %17, %104
  %102 = phi i64 [ %108, %104 ], [ 0, %17 ]
  %103 = icmp eq i64 %102, 1000
  br i1 %103, label %109, label %104

104:                                              ; preds = %101
  %105 = getelementptr inbounds [1000 x i64], ptr %4, i64 0, i64 %102
  %106 = load i64, ptr %105, align 8, !tbaa !5
  %107 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i64 noundef %106) #6
  %108 = add nuw nsw i64 %102, 1
  br label %101, !llvm.loop !13

109:                                              ; preds = %101
  call void @llvm.lifetime.end.p0(i64 8000, ptr nonnull %4) #4
  call void @llvm.lifetime.end.p0(i64 8000, ptr nonnull %3) #4
  call void @llvm.lifetime.end.p0(i64 8000, ptr nonnull %2) #4
  call void @llvm.lifetime.end.p0(i64 8000, ptr nonnull %1) #4
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: minsize nounwind optsize
declare void @srand(i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: minsize nounwind optsize
declare i32 @rand() local_unnamed_addr #2

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #3

attributes #0 = { minsize nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { minsize nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { minsize nounwind optsize }
attributes #6 = { minsize optsize }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 17.0.6"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}

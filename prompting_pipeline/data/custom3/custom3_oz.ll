; ModuleID = 'custom3.c'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.4 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: minsize nofree nounwind optsize uwtable
define dso_local void @printMatrix(ptr nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %10, %1
  %3 = phi i64 [ %12, %10 ], [ 0, %1 ]
  %4 = icmp eq i64 %3, 5
  br i1 %4, label %5, label %7

5:                                                ; preds = %2
  %6 = tail call i32 @putchar(i32 10)
  ret void

7:                                                ; preds = %2, %13
  %8 = phi i64 [ %17, %13 ], [ 0, %2 ]
  %9 = icmp eq i64 %8, 5
  br i1 %9, label %10, label %13

10:                                               ; preds = %7
  %11 = tail call i32 @putchar(i32 10)
  %12 = add nuw nsw i64 %3, 1
  br label %2, !llvm.loop !5

13:                                               ; preds = %7
  %14 = getelementptr inbounds [5 x i32], ptr %0, i64 %3, i64 %8
  %15 = load i32, ptr %14, align 4, !tbaa !7
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %15) #7
  %17 = add nuw nsw i64 %8, 1
  br label %7, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: minsize nofree nounwind optsize
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) uwtable
define dso_local void @manipulateMatrix(ptr nocapture noundef %0) local_unnamed_addr #3 {
  br label %2

2:                                                ; preds = %14, %1
  %3 = phi i64 [ %15, %14 ], [ 0, %1 ]
  %4 = icmp eq i64 %3, 5
  br i1 %4, label %5, label %6

5:                                                ; preds = %2
  ret void

6:                                                ; preds = %2, %20
  %7 = phi i64 [ %21, %20 ], [ 0, %2 ]
  %8 = icmp eq i64 %7, 5
  br i1 %8, label %14, label %9

9:                                                ; preds = %6
  %10 = getelementptr inbounds [5 x i32], ptr %0, i64 %3, i64 %7
  %11 = add nuw nsw i64 %7, %3
  %12 = load i32, ptr %10, align 4, !tbaa !7
  %13 = trunc i64 %11 to i32
  br label %16

14:                                               ; preds = %6
  %15 = add nuw nsw i64 %3, 1
  br label %2, !llvm.loop !12

16:                                               ; preds = %9, %28
  %17 = phi i32 [ %25, %28 ], [ %12, %9 ]
  %18 = phi i32 [ %29, %28 ], [ 0, %9 ]
  %19 = icmp eq i32 %18, 5
  br i1 %19, label %20, label %22

20:                                               ; preds = %16
  store i32 %17, ptr %10, align 4, !tbaa !7
  %21 = add nuw nsw i64 %7, 1
  br label %6, !llvm.loop !13

22:                                               ; preds = %16
  %23 = add nsw i32 %17, %18
  br label %24

24:                                               ; preds = %33, %22
  %25 = phi i32 [ %23, %22 ], [ %34, %33 ]
  %26 = phi i32 [ 0, %22 ], [ %31, %33 ]
  %27 = icmp eq i32 %26, 5
  br i1 %27, label %28, label %30

28:                                               ; preds = %24
  %29 = add nuw nsw i32 %18, 1
  br label %16, !llvm.loop !14

30:                                               ; preds = %24
  %31 = add nuw nsw i32 %26, 1
  %32 = mul nsw i32 %25, %31
  br label %33

33:                                               ; preds = %44, %30
  %34 = phi i32 [ %32, %30 ], [ %41, %44 ]
  %35 = phi i32 [ 0, %30 ], [ %45, %44 ]
  %36 = icmp eq i32 %35, 5
  br i1 %36, label %24, label %37, !llvm.loop !15

37:                                               ; preds = %33
  %38 = mul nuw nsw i32 %35, %13
  %39 = sub nsw i32 %34, %38
  br label %40

40:                                               ; preds = %46, %37
  %41 = phi i32 [ %39, %37 ], [ %51, %46 ]
  %42 = phi i32 [ 0, %37 ], [ %52, %46 ]
  %43 = icmp eq i32 %42, 5
  br i1 %43, label %44, label %46

44:                                               ; preds = %40
  %45 = add nuw nsw i32 %35, 1
  br label %33, !llvm.loop !16

46:                                               ; preds = %40
  %47 = and i32 %42, 1
  %48 = icmp eq i32 %47, 0
  %49 = sub nsw i32 0, %42
  %50 = select i1 %48, i32 %42, i32 %49
  %51 = add i32 %41, %50
  %52 = add nuw nsw i32 %42, 1
  br label %40, !llvm.loop !17
}

; Function Attrs: minsize nounwind optsize uwtable
define dso_local i32 @main() local_unnamed_addr #4 {
  %1 = alloca [5 x [5 x i32]], align 16
  call void @llvm.lifetime.start.p0(i64 100, ptr nonnull %1) #8
  br label %2

2:                                                ; preds = %11, %0
  %3 = phi i64 [ %12, %11 ], [ 0, %0 ]
  %4 = icmp eq i64 %3, 5
  br i1 %4, label %5, label %8

5:                                                ; preds = %2
  %6 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1) #7
  call void @manipulateMatrix(ptr noundef nonnull %1) #7
  %7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.4)
  call void @printMatrix(ptr noundef nonnull %1) #7
  call void @llvm.lifetime.end.p0(i64 100, ptr nonnull %1) #8
  ret i32 0

8:                                                ; preds = %2, %13
  %9 = phi i64 [ %17, %13 ], [ 0, %2 ]
  %10 = icmp eq i64 %9, 5
  br i1 %10, label %11, label %13

11:                                               ; preds = %8
  %12 = add nuw nsw i64 %3, 1
  br label %2, !llvm.loop !18

13:                                               ; preds = %8
  %14 = tail call i32 @rand() #9
  %15 = srem i32 %14, 10
  %16 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %3, i64 %9
  store i32 %15, ptr %16, align 4, !tbaa !7
  %17 = add nuw nsw i64 %9, 1
  br label %8, !llvm.loop !19
}

; Function Attrs: minsize nounwind optsize
declare i32 @rand() local_unnamed_addr #5

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #6

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #6

attributes #0 = { minsize nofree nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { minsize nofree nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { minsize nofree norecurse nosync nounwind optsize memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { minsize nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { minsize nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree nounwind }
attributes #7 = { minsize optsize }
attributes #8 = { nounwind }
attributes #9 = { minsize nounwind optsize }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 17.0.6"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}

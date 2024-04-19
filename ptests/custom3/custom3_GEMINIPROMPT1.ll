; ModuleID = 'custom3_unoptimized.ll'
source_filename = "custom3.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [18 x i8] c"Original Matrix:\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"Manipulated Matrix:\0A\00", align 1
@str = private unnamed_addr constant [17 x i8] c"Original Matrix:\00", align 1
@str.1 = private unnamed_addr constant [20 x i8] c"Manipulated Matrix:\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @printMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %14, %1
  %.01 = phi i32 [ 0, %1 ], [ %15, %14 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %16

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %7, %4
  %.0 = phi i32 [ 0, %4 ], [ %13, %7 ]
  %6 = icmp ult i32 %.0, 5
  br i1 %6, label %7, label %14

7:                                                ; preds = %5
  %8 = zext i32 %.01 to i64
  %9 = zext i32 %.0 to i64
  %10 = getelementptr inbounds [5 x i32], ptr %0, i64 %8, i64 %9
  %11 = load i32, ptr %10, align 4
  %12 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, i32 noundef %11) #4
  %13 = add nuw nsw i32 %.0, 1
  br label %5, !llvm.loop !6

14:                                               ; preds = %5
  %putchar2 = call i32 @putchar(i32 10)
  %15 = add nuw nsw i32 %.01, 1
  br label %2, !llvm.loop !8

16:                                               ; preds = %2
  %putchar = call i32 @putchar(i32 10)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @manipulateMatrix(ptr noundef %0) #0 {
  br label %2

2:                                                ; preds = %48, %1
  %.01 = phi i32 [ 0, %1 ], [ %49, %48 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %50

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %46, %4
  %.02 = phi i32 [ 0, %4 ], [ %47, %46 ]
  %6 = icmp ult i32 %.02, 5
  br i1 %6, label %7, label %48

7:                                                ; preds = %5
  br label %8

8:                                                ; preds = %44, %7
  %.03 = phi i32 [ 0, %7 ], [ %45, %44 ]
  %9 = icmp ult i32 %.03, 5
  br i1 %9, label %10, label %46

10:                                               ; preds = %8
  %11 = zext i32 %.01 to i64
  %12 = zext i32 %.02 to i64
  %13 = getelementptr inbounds [5 x i32], ptr %0, i64 %11, i64 %12
  %14 = load i32, ptr %13, align 4
  %15 = add nsw i32 %14, %.03
  store i32 %15, ptr %13, align 4
  br label %16

16:                                               ; preds = %43, %10
  %17 = phi i32 [ %15, %10 ], [ %23, %43 ]
  %.04 = phi i32 [ 0, %10 ], [ %20, %43 ]
  %18 = icmp ult i32 %.04, 5
  br i1 %18, label %19, label %44

19:                                               ; preds = %16
  %20 = add nuw nsw i32 %.04, 1
  %21 = mul nsw i32 %17, %20
  store i32 %21, ptr %13, align 4
  br label %22

22:                                               ; preds = %41, %19
  %23 = phi i32 [ %21, %19 ], [ %30, %41 ]
  %.05 = phi i32 [ 0, %19 ], [ %42, %41 ]
  %24 = icmp ult i32 %.05, 5
  br i1 %24, label %25, label %43

25:                                               ; preds = %22
  %26 = add nuw nsw i32 %.01, %.02
  %27 = mul nsw i32 %.05, %26
  %28 = sub nsw i32 %23, %27
  store i32 %28, ptr %13, align 4
  br label %29

29:                                               ; preds = %39, %25
  %30 = phi i32 [ %28, %25 ], [ %storemerge, %39 ]
  %.0 = phi i32 [ 0, %25 ], [ %40, %39 ]
  %31 = icmp ult i32 %.0, 5
  br i1 %31, label %32, label %41

32:                                               ; preds = %29
  %33 = and i32 %.0, 1
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %37

35:                                               ; preds = %32
  %36 = add nsw i32 %30, %.0
  br label %39

37:                                               ; preds = %32
  %38 = sub nsw i32 %30, %.0
  br label %39

39:                                               ; preds = %35, %37
  %storemerge = phi i32 [ %38, %37 ], [ %36, %35 ]
  store i32 %storemerge, ptr %13, align 4
  %40 = add nuw nsw i32 %.0, 1
  br label %29, !llvm.loop !9

41:                                               ; preds = %29
  %42 = add nuw nsw i32 %.05, 1
  br label %22, !llvm.loop !10

43:                                               ; preds = %22
  br label %16, !llvm.loop !11

44:                                               ; preds = %16
  %45 = add nuw nsw i32 %.03, 1
  br label %8, !llvm.loop !12

46:                                               ; preds = %8
  %47 = add nuw nsw i32 %.02, 1
  br label %5, !llvm.loop !13

48:                                               ; preds = %5
  %49 = add nuw nsw i32 %.01, 1
  br label %2, !llvm.loop !14

50:                                               ; preds = %2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca [5 x [5 x i32]], align 16
  br label %2

2:                                                ; preds = %14, %0
  %.01 = phi i32 [ 0, %0 ], [ %15, %14 ]
  %3 = icmp ult i32 %.01, 5
  br i1 %3, label %4, label %16

4:                                                ; preds = %2
  br label %5

5:                                                ; preds = %7, %4
  %.0 = phi i32 [ 0, %4 ], [ %13, %7 ]
  %6 = icmp ult i32 %.0, 5
  br i1 %6, label %7, label %14

7:                                                ; preds = %5
  %8 = call i32 @rand() #4
  %9 = srem i32 %8, 10
  %10 = zext i32 %.01 to i64
  %11 = zext i32 %.0 to i64
  %12 = getelementptr inbounds [5 x [5 x i32]], ptr %1, i64 0, i64 %10, i64 %11
  store i32 %9, ptr %12, align 4
  %13 = add nuw nsw i32 %.0, 1
  br label %5, !llvm.loop !15

14:                                               ; preds = %5
  %15 = add nuw nsw i32 %.01, 1
  br label %2, !llvm.loop !16

16:                                               ; preds = %2
  %puts = call i32 @puts(ptr nonnull dereferenceable(1) @str)
  call void @printMatrix(ptr noundef nonnull %1)
  call void @manipulateMatrix(ptr noundef nonnull %1)
  %puts2 = call i32 @puts(ptr nonnull dereferenceable(1) @str.1)
  call void @printMatrix(ptr noundef nonnull %1)
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @rand() #2

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) #3

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.6"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
